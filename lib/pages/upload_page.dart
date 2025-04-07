import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/category_button.dart';
import '../utils/category_utils.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _selectedCategory;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _submitProduct() {
    if (_imageFile == null ||
        _nameController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _selectedCategory == null) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('알림'),
          content: const Text('모든 항목에 기입해주세요'),
          actions: [
            CupertinoDialogAction(
              child: const Text('확인'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    final product = Product(
      id: DateTime.now().toString(),
      name: _nameController.text,
      price: int.parse(_priceController.text),
      description: _descriptionController.text,
      category: _selectedCategory!,
      image: _imageFile!,
      createdAt: DateTime.now(),
    );

    Provider.of<ProductProvider>(context, listen: false).addProduct(product);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageSelector(),
              const SizedBox(height: 24),
              _buildInputFields(),
              _buildCategorySection(),
              const SizedBox(height: 16),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSelector() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
        image: _imageFile != null
            ? DecorationImage(
                image: FileImage(_imageFile!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: _imageFile == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Image 선택',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.blue,
                    size: 40,
                  ),
                  onPressed: _showImagePickerOptions,
                ),
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: _showImagePickerOptions,
                ),
              ],
            ),
    );
  }

  void _showImagePickerOptions() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('이미지 선택'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
              child: const Text('갤러리에서 선택'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                _pickImage(ImageSource.camera);
              },
              child: const Text('사진 찍기'),
            ),
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('취소'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      // 에러 처리
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('이미지 선택 중 오류가 발생했습니다.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        CustomTextField(
          label: '상품명',
          controller: _nameController,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: '상품 가격',
          controller: _priceController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: '상품 상세설명',
          controller: _descriptionController,
          maxLines: 5,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('카테고리', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            CategoryUtils.categories.length,
            (index) => CategoryButton(
              title: CategoryUtils.categories[index],
              isSelected: _selectedCategory == index,
              onTap: () => setState(() {
                _selectedCategory = _selectedCategory == index ? null : index;
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 45,
        child: ElevatedButton(
          onPressed: _submitProduct,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFEE7C5),
            foregroundColor: Colors.black,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('등록하기'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
