import 'package:flutter/material.dart';

class PaymentCompletePage extends StatelessWidget {
  const PaymentCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 340,
            height: 369,
            padding: EdgeInsets.all(20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 체크 이미지 (초록색 체크로 바꾸고 싶으면 Icon 사용 가능)
                Container(
                  width: 101,
                  height: 101,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/101/101"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '결제가 완료되었습니다',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '결제 금액',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Inter',
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      '####원',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Inter',
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
