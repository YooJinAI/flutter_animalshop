import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ProductDetailPage());
  }
}

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 상단 이미지 영역
            Container(
              width: 393,
              height: 400,
              color: Color(0xFFD9D9D9),
              child: Center(
                child: Text(
                  'Image',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),

            // 상품명, 가격
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '상품명',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    '가격',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),

            // 카테고리 태그
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('#카테고리', style: TextStyle(fontSize: 12)),
                ),
              ),
            ),

            SizedBox(height: 12),

            // 상품 설명 제목
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '상품 설명',
                  style: TextStyle(fontSize: 16, fontFamily: 'Inter'),
                ),
              ),
            ),

            // 설명 입력창 스타일 영역
            Container(
              width: 340,
              height: 144,
              margin: EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.black12),
                ),
              ),
            ),

            Spacer(),

            // 하단 버튼 2개
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          fontSize: 12,
                          fontFamily: 'Inter',
                          color: Colors.black,
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
                          fontSize: 12,
                          fontFamily: 'Inter',
                          color: Colors.black,
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

void showPurchaseModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(16),
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 상품 이미지, 이름, 수량 선택
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      '상품 image',
                      style: TextStyle(fontSize: 10, fontFamily: 'Righteous'),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '상품 이름',
                        style: TextStyle(fontSize: 14, fontFamily: 'Righteous'),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('-', style: TextStyle(fontSize: 11)),
                          Container(
                            width: 55,
                            height: 30,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(child: Text('1')),
                          ),
                          Text('+', style: TextStyle(fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  '9999원',
                  style: TextStyle(fontSize: 20, fontFamily: 'Righteous'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 결제 방법
            Text('결제 방법', style: TextStyle(fontSize: 18)),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(side: BorderSide(width: 3)),
                  ),
                ),
                SizedBox(width: 8),
                Text('신용/체크카드'),
              ],
            ),
            SizedBox(height: 20),

            // 품절시 환불 방법
            Container(
              width: 377,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '품절시 환불 방법',
                    style: TextStyle(fontSize: 20, fontFamily: 'Righteous'),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '환불 받으신 날짜 기준으로 3~5일(주말제외) 후\n',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Righteous',
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '결제대행사에서 직접 고객님의 계좌로 환불 처리 됩니다.',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Righteous',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // 이용약관, 동의 문구
            Container(
              width: 377,
              padding: EdgeInsets.all(12),
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '결제 서비스 이용약관 >',
                    style: TextStyle(fontFamily: 'Righteous', fontSize: 14),
                  ),
                  Text(
                    '개인정보 수집 및 이용 동의 >',
                    style: TextStyle(fontFamily: 'Righteous', fontSize: 14),
                  ),
                  Text(
                    '개인정보 제공 안내 >',
                    style: TextStyle(fontFamily: 'Righteous', fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '구매 내용에 동의하시면 구매하기 버튼을 눌러주세요.',
                    style: TextStyle(fontFamily: 'Righteous', fontSize: 14),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // 캐릭터 이미지
            Center(
              child: Container(
                width: 101,
                height: 93,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://picsum.photos/101/93"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // 하단 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFEE7C5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '장바구니에 담기',
                      style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
                    ),
                  ),
                ),
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFFEE7C5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '####원\n구매하기',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );

