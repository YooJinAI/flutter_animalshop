import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEE7C5),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: SizedBox(
            height: 45,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지 선택 영역
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
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
                      onPressed: () {
                        // 이미지 선택 로직 구현
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 상품명 입력
              const Text('상품명', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 상품 가격 입력
              const Text('상품 가격', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 카테고리 선택
              const Text('카테고리', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                            border: index == _selectedCategory
                                ? Border.all(
                                    color: const Color(0xFF76FF03),
                                    width: 2,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '카테고리',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 상품 상세설명
              const Text('상품 상세설명', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              const SizedBox(height: 16),

              // 등록하기 버튼
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // 등록 로직 구현
                      },
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
                ),
              ),
            ],
          ),
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

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final orangePaint = Paint()
      ..color = const Color(0xFFFFAA00)
      ..style = PaintingStyle.fill;

    // 메인 잎 모양 그리기
    final path = Path();

    // 시작점 (왼쪽 아래)
    path.moveTo(size.width * 0.2, size.height * 0.7);

    // 왼쪽에서 위로 곡선
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.3, // 제어점
      size.width * 0.5,
      size.height * 0.3, // 끝점
    );

    // 오른쪽으로 곡선
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.3, // 제어점
      size.width * 0.8,
      size.height * 0.7, // 끝점
    );

    // 작은 주황색 잎 모양
    final smallLeafPath = Path();
    smallLeafPath.moveTo(size.width * 0.6, size.height * 0.45);
    smallLeafPath.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.4,
      size.width * 0.65,
      size.height * 0.5,
    );

    canvas.drawPath(path, paint);
    canvas.drawPath(smallLeafPath, orangePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
