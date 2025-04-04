import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedCategory;
  final List<String> categories = ['사료', '간식', '옷'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Column(children: [_buildCategoryButtons(), _buildProductGrid()]),
          _buildAddProductButton(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // AppBar 위젯
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFFEE7C5),
      elevation: 0,
      centerTitle: true,
      title: Image.asset('assets/logo.png', width: 50, height: 50),
    );
  }

  // 카테고리 버튼 위젯
  Widget _buildCategoryButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          categories.length,
          (index) => CategoryButton(
            title: categories[index],
            isSelected: selectedCategory == index,
            onTap: () => _handleCategoryTap(index),
          ),
        ),
      ),
    );
  }

  // 카테고리 탭 핸들러
  void _handleCategoryTap(int index) {
    setState(() {
      selectedCategory = selectedCategory == index ? null : index;
    });
  }

  // 상품 그리드 위젯
  Widget _buildProductGrid() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: 20,
        itemBuilder:
            (context, index) => ProductCard(
              productName: '상품명',
              category: '카테고리',
              price: '₩25,000',
            ),
      ),
    );
  }

  // 상품 등록 버튼
  Widget _buildAddProductButton() {
    return Positioned(
      right: 16,
      bottom: 16,
      child: FloatingActionButton(
        onPressed: () {
          // TODO: 상품 등록 페이지로 이동
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  // 하단 네비게이션 바
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: '장바구니'),
      ],
    );
  }
}

// 카테고리 버튼 위젯
class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.green : Colors.grey,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Icon(
                _getCategoryIcon(),
                color: isSelected ? Colors.green : Colors.grey,
                size: 30,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.green : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  IconData _getCategoryIcon() {
    switch (title) {
      case '사료':
        return Icons.pets;
      case '간식':
        return Icons.cookie;
      case '옷':
        return Icons.checkroom;
      default:
        return Icons.pets;
    }
  }
}

// 상품 카드 위젯
class ProductCard extends StatelessWidget {
  final String productName;
  final String category;
  final String price;

  const ProductCard({
    super.key,
    required this.productName,
    required this.price,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    _buildCategoryTag(),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 카테고리 태그
  Widget _buildCategoryTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '#$category',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
