import 'package:flutter/cupertino.dart';

class CartEmptyPage extends StatelessWidget {
  const CartEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: const Color(0xFFF4E3C3),
        leading:
            const CupertinoNavigationBarBackButton(),
        middle: Image.asset(
          'assets/logo.png',
          height: 30,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Text(
                '장바구니가 비어있습니다',
                style:
                    CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: CupertinoButton(
                  color: const Color(0xFFF4E3C3),
                  child: const Text(
                    '구매하기',
                    style: TextStyle(
                      color:
                          CupertinoColors.black,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/cart2',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
