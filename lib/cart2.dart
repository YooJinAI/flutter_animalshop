import 'package:flutter/cupertino.dart';

class CartPaymentPage extends StatefulWidget {
  const CartPaymentPage({super.key});

  @override
  State<CartPaymentPage> createState() =>
      _CartPaymentPageState();
}

class _CartPaymentPageState
    extends State<CartPaymentPage> {
  bool isCardSelected = false;
  final int totalAmount = 35000;

  void _showPaymentCompleteDialog() {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoAlertDialog(
            content: Column(
              children: [
                const Icon(
                  CupertinoIcons.checkmark_circle,
                  color:
                      CupertinoColors.activeGreen,
                  size: 50,
                ),
                const SizedBox(height: 16),
                const Text('결제가 완료되었습니다'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                  children: [
                    const Text('결제 금액'),
                    Text('₩$totalAmount'),
                  ],
                ),
              ],
            ),
          ),
    );
  }

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
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 20),
                const Text(
                  '결제 방법',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCardSelected =
                          !isCardSelected;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        isCardSelected
                            ? CupertinoIcons
                                .checkmark_circle_fill
                            : CupertinoIcons
                                .circle,
                        color:
                            isCardSelected
                                ? CupertinoColors
                                    .activeBlue
                                : CupertinoColors
                                    .inactiveGray,
                      ),
                      const SizedBox(width: 8),
                      const Text('신용 체크카드'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '품절시 환불 방법',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '환불 받으신 날짜 기준으로 3~5일(주말제외) 후 결제대행사에서 직접 고객님의 계좌로 환불 처리 됩니다',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 32),
                _buildTermsItem('결제 서비스 이용약관'),
                _buildTermsItem(
                  '개인정보 수집 및 이용 동의',
                ),
                _buildTermsItem('개인정보 제공 안내'),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border(
                    top: BorderSide(
                      color:
                          CupertinoColors
                              .systemGrey5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [
                        const Text(
                          '총 금액',
                          style: TextStyle(
                            color:
                                CupertinoColors
                                    .systemGrey,
                          ),
                        ),
                        Text(
                          '₩$totalAmount',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CupertinoButton(
                      color: const Color(
                        0xFFF4E3C3,
                      ),
                      child: const Text(
                        '구매하기',
                        style: TextStyle(
                          color:
                              CupertinoColors
                                  .black,
                        ),
                      ),
                      onPressed:
                          _showPaymentCompleteDialog,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          const Icon(
            CupertinoIcons.right_chevron,
            color: CupertinoColors.systemGrey,
            size: 16,
          ),
        ],
      ),
    );
  }
}
