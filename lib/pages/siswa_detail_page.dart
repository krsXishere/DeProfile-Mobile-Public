import 'package:flutter/material.dart';

import '../common/theme.dart';
import '../widget/listtile_profile_school_widget.dart';

class SiswaDetailPage extends StatefulWidget {
  const SiswaDetailPage({super.key});

  @override
  State<SiswaDetailPage> createState() => _SiswaDetailPageState();
}

class _SiswaDetailPageState extends State<SiswaDetailPage> {
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
          "Detail Guru",
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
                        title: "NISN",
                        value: "0055361481",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Nama",
                        value: "Krisna Purnama",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Jenis Kelamin",
                        value: "Laki-laki",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Tempat Lahir",
                        value: "Sumedang",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Tanggal Lahir",
                        value: "1995-02-02",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Pendidikan",
                        value: "Sarjana Terapan",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Jurusan",
                        value: "Teknik Informatika",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Alamat",
                        value:
                            "Dusun Piwelas rt/rw 02/09, Desa Margamekar, Kec. Sumedang Selatan, Kab. Sumedang, Jawa Barat",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "No. Telpon",
                        value: "81222757761",
                      ),
                      ListTileProfileSchoolWidget(
                        title: "Alamat Email",
                        value: "krisnapurnama@gmail.com",
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
