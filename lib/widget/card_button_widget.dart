import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../common/theme.dart';

class CardButtonWidget extends StatelessWidget {
  final String title;
  final Widget page;

  const CardButtonWidget({
    super.key,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: page,
            type: PageTransitionType.rightToLeft,
          ),
        );
      },
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryGreen,
          borderRadius: BorderRadius.circular(
            defaultBorderRadius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                color: white,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: white,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
