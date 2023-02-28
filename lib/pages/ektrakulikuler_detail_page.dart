import 'package:flutter/material.dart';
import '../common/theme.dart';
import '../widget/listtile_profile_school_widget.dart';

class EkstrakulikulerDetailPage extends StatefulWidget {
  const EkstrakulikulerDetailPage({super.key});

  @override
  State<EkstrakulikulerDetailPage> createState() =>
      _EkstrakulikulerDetailPageState();
}

class _EkstrakulikulerDetailPageState extends State<EkstrakulikulerDetailPage> {
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
          "Detail Ekstrakulikuler",
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
        child: Padding(
          padding: EdgeInsets.all(
            defaultPadding,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(
                      defaultBorderRadius,
                    ),
                  ),
                  child: Column(
                    children: const [
                      ListTileProfileSchoolWidget(
                        title: "Nama Ekstrakulikuler",
                        value: "IT Club Nesas",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Jenis",
                        value: "IT/Akademik",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
