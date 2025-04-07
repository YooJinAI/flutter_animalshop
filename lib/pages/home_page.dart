import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/category_button.dart';
import '../widgets/product_card.dart';
import '../utils/category_utils.dart';
import '../providers/product_provider.dart';
import 'upload_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          _buildCategorySection(),
          Expanded(
            child: Consumer<ProductProvider>(
              builder: (ctx, productProvider, child) {
                final products = productProvider.products;
                if (products.isEmpty) {
                  return const Center(
                    child: Text('등록된 상품이 없습니다.'),
                  );
                }

                // 선택된 카테고리에 따라 상품 필터링
                final filteredProducts = selectedCategory != null
                    ? products
                        .where(
                            (product) => product.category == selectedCategory)
                        .toList()
                    : products;

                if (filteredProducts.isEmpty) {
                  return const Center(
                    child: Text('해당 카테고리의 상품이 없습니다.'),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (ctx, index) {
                    final product = filteredProducts[index];
                    return ProductCard(
                      id: product.id,
                      name: product.name,
                      price: product.price,
                      description: product.description,
                      category: CategoryUtils.categories[product.category],
                      image: product.image,
                      onDelete: () {
                        productProvider.deleteProduct(product.id);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UploadPage()),
          );
        },
        backgroundColor: const Color(0xFFFEE7C5),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          CategoryUtils.categories.length,
          (index) => CategoryButton(
            title: CategoryUtils.categories[index],
            isSelected: selectedCategory == index,
            onTap: () => _handleCategoryTap(index),
          ),
        ),
      ),
    );
  }

  void _handleCategoryTap(int index) {
    setState(() {
      selectedCategory = selectedCategory == index ? null : index;
    });
  }
}
