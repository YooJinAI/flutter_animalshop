import 'package:flutter/material.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 상단 헤더
            Container(
              color: Color(0xFFFEE7C5),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Icon(Icons.eco), // 로고용 임시 아이콘
                  Icon(Icons.close, color: Colors.transparent),
                ],
              ),
            ),

            // 상품 정보 카드
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 377,
                height: 107,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    // 이미지
                    Container(
                      width: 88.26,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFC4C4C4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '상품 image',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Righteous',
                            height: 0.16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),

                    // 이름 + 수량 + 가격
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '상품 이름',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Righteous',
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Center(child: Text('-')),
                              ),
                              SizedBox(width: 8),
                              Container(
                                width: 55,
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Center(child: Text('1')),
                              ),
                              SizedBox(width: 8),
                              Container(
                                width: 20,
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Center(child: Text('+')),
                              ),
                              Spacer(),
                              Text(
                                '9999원',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Righteous',
                                  height: 0.04,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Icon(Icons.close),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            // 결제 방법
            Container(
              width: 377,
              height: 107,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '결제 방법',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Righteous',
                      height: 0.04,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: OvalBorder(
                            side: BorderSide(width: 3),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '신용 체크카드',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Righteous',
                          height: 0.16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // 환불 안내
            Container(
              width: 377,
              height: 107,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '품절시 환불 방법',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Righteous',
                      height: 0.04,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '환불 받으신 날짜 기준으로 3~5일(주말제외) 후\n',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Righteous',
                            height: 0.08,
                          ),
                        ),
                        TextSpan(
                          text: '결제대행사에서 직접 고객님의 계좌로 환불 처리 됩니다',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Righteous',
                            height: 0.08,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // 약관 + 안내 + 이미지
            Container(
              width: 377,
              height: 294,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('결제 서비스 이용약관 >',
                      style: _infoTextStyle()),
                  Text('개인정보 수집 및 이용 동의 > ',
                      style: _infoTextStyle()),
                  Text('개인정보 제공 안내 >',
                      style: _infoTextStyle()),
                  SizedBox(height: 8),
                  Text(
                    '구매 내용에 동의하시면 구매하기 버튼을 눌러주세요.',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Righteous',
                      height: 0.08,
                    ),
                  ),
                  Spacer(),
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
                ],
              ),
            ),

            Spacer(),

            // 하단 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: _buttonStyle(),
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
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: _buttonStyle(),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _infoTextStyle() {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'Righteous',
      height: 0.08,
    );
  }

  BoxDecoration _buttonStyle() {
  return BoxDecoration(
    color: Color(0xFFFEE7C5),
    borderRadius: BorderRadius.circular(10),
  );
}