import 'package:flutter/material.dart';

class DefaultSizedBoxWidget extends StatelessWidget {
  final double height, width;
  const DefaultSizedBoxWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
