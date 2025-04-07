import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: 393,
        height: 852,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(side: BorderSide(width: 1)),
        ),
        child: Column(
          children: [
            // 상단 헤더
            Container(
              width: 393,
              height: 96,
              decoration: BoxDecoration(color: Color(0xFFFEE7C5)),
              child: Center(
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/42/42"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),

            // 이미지 영역
            SizedBox(
              width: 113,
              height: 101,
              child: Center(
                child: Text(
                  'Image',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontFamily: 'Inter',
                    height: 0.04,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // 상품명과 가격
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 123,
                    height: 55,
                    child: Text(
                      '상품명',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'Inter',
                        height: 0.04,
                      ),
                    ),
                  ),
                  Text(
                    '가격',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // 카테고리 태그
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '#카테고리',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Inter',
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(height: 12),

            // 설명 영역
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '상품 설명',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 340,
                    height: 144,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFE6E6E6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Spacer(),

            // 하단 버튼들
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 장바구니 버튼
                  Container(
                    width: 155,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFEE7C5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '장바구니에 담기',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          height: 0.12,
                        ),
                      ),
                    ),
                  ),
                  // 구매하기 버튼
                  Container(
                    width: 155,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFEE7C5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '####원\n구매하기',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          height: 0.12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
