import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../common/theme.dart';
import 'teacher_detail_page.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({super.key});

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Guru",
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: defaultPadding),
            child: CircleAvatar(
              backgroundColor: secondaryGreen,
              child: const FlutterLogo(),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 11,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: defaultPadding),
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: const TeacherDetailPage(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    defaultBorderRadius,
                  ),
                ),
                title: Text(
                  "Mohamad Echa Saputra",
                  style: primaryTextStyle,
                ),
                subtitle: Text(
                  "Teknik Informatika",
                  style: primaryTextStyle,
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: black,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
