import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String currency;
  final int balance;
  final String currencyCode;
  final IconData symbol;
  final int order;

  const MyCard({
    super.key,
    required this.currency,
    required this.balance,
    required this.currencyCode,
    required this.symbol,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = order % 2 == 1;
    Color backgroundColor = isDark ? Colors.grey : Colors.white;
    Color textColor = isDark ? Colors.white : Colors.black;
    double offset = -35.0 * (order - 1);

    return Transform.translate(
      offset: Offset(0, offset),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topRight: Radius.elliptical(70, 40),
            bottomLeft: Radius.elliptical(70, 40),
          ),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currency,
                      style: TextStyle(
                        fontSize: 28,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "$balance",
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          currencyCode,
                          style: TextStyle(
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 2.0,
                child: Transform.translate(
                  offset: const Offset(0, 20),
                  child: Icon(
                    symbol,
                    size: 69,
                    color: textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
