import 'package:flutter/material.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF4E9),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: SizedBox(
          height: 40,
          child: CustomPaint(
            painter: LogoPainter(),
            size: Size(40, 40),
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
                    Text(
                      'Image 선택',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    IconButton(
                      icon: Icon(Icons.add_circle, color: Colors.blue, size: 40),
                      onPressed: () {
                        // 이미지 선택 로직 구현
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              
              // 상품명 입력
              Text('상품명', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              SizedBox(height: 16),
              
              // 상품 가격 입력
              Text('상품 가격', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              SizedBox(height: 16),
              
              // 카테고리 선택
              Text('카테고리', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = index;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedCategory == index
                              ? Colors.green
                              : Colors.grey[300],
                        ),
                        child: Center(
                          child: Text(
                            '카테고리',
                            style: TextStyle(
                              color: _selectedCategory == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              
              // 상품 상세설명
              Text('상품 상세설명', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              SizedBox(height: 24),
              
              // 등록하기 버튼
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 등록 로직 구현
                  },
                  child: Text('등록하기'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFF4E9),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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
      ..strokeWidth = 2.0;

    final orangePaint = Paint()
      ..color = Color(0xFFFFAA00)
      ..style = PaintingStyle.fill;

    // 잎 모양 그리기
    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.5, size.height * 0.2,
        size.width * 0.8, size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.5, size.height * 0.8,
        size.width * 0.2, size.height * 0.5,
      );

    // 작은 잎 모양 그리기
    final smallLeafPath = Path()
      ..moveTo(size.width * 0.6, size.height * 0.4)
      ..quadraticBezierTo(
        size.width * 0.65, size.height * 0.35,
        size.width * 0.7, size.height * 0.4,
      )
      ..quadraticBezierTo(
        size.width * 0.65, size.height * 0.45,
        size.width * 0.6, size.height * 0.4,
      );

    canvas.drawPath(path, paint);
    canvas.drawPath(smallLeafPath, orangePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
