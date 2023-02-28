import 'package:de_profile_public/providers/jurusan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';
import '../widget/listtile_profile_school_widget.dart';

class JurusanDetailPage extends StatefulWidget {
  final int? id;
  const JurusanDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<JurusanDetailPage> createState() => _JurusanDetailPageState();
}

class _JurusanDetailPageState extends State<JurusanDetailPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<JurusanProvider>(
        context,
        listen: false,
      ).getSingleSekolah(widget.id);
    });

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
          "Detail Jurusan",
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: defaultPadding),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                "assets/svg/logo-1.svg",
                color: primaryGreen,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<JurusanProvider>(builder: (context, value, child) {
        final jurusan = value.singleJurusan;

        return SafeArea(
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
                      children: [
                        ListTileProfileSchoolWidget(
                          title: "Nama Jurusan",
                          value: jurusan?.jurusan,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Keterangan",
                          value: jurusan?.keterangan,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Tahun",
                          value: jurusan?.tahun,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Kurikulum",
                          value: jurusan?.kurikulumId == 1
                              ? "Kurikulum 2013"
                              : jurusan?.kurikulumId == 2
                                  ? "Kurikulum Merdeka"
                                  : jurusan?.kurikulumId == 3
                                      ? "Kurikulum Darurat"
                                      : "",
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Akreditasi",
                          value: jurusan?.akreditasi,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
