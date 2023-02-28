import 'package:flutter/material.dart';
import '../common/theme.dart';

class ListTileProfileSchoolWidget extends StatelessWidget {
  final String? title, value;
  const ListTileProfileSchoolWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title.toString(),
        style: primaryTextStyle.copyWith(
          color: white,
          fontSize: 20,
        ),
      ),
      subtitle: SelectableText(
        value.toString(),
        style: primaryTextStyle.copyWith(
          color: white,
          fontSize: 16,
        ),
      ),
    );
  }
}
