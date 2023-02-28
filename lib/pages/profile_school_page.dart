import 'package:de_profile_public/pages/ekstrakulikuler_page.dart';
import 'package:de_profile_public/pages/fasilitas_page.dart';
import 'package:de_profile_public/pages/galeri_page.dart';
import 'package:de_profile_public/pages/jurusan_page.dart';
// import 'package:de_profile_public/pages/kurikulum_page.dart';
import 'package:de_profile_public/pages/prestasi_page.dart';
// import 'package:de_profile_public/pages/siswa_page.dart';
// import 'package:de_profile_public/pages/teacher_page.dart';
import 'package:de_profile_public/widget/card_button_widget.dart';
import 'package:de_profile_public/widget/listtile_profile_school_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';
import '../providers/sekolah_provider.dart';
import '../common/globals.dart' as global;

class ProfileSchoolPage extends StatefulWidget {
  final int? id;
  const ProfileSchoolPage({
    super.key,
    required this.id,
  });

  @override
  State<ProfileSchoolPage> createState() => _ProfileSchoolPageState();
}

class _ProfileSchoolPageState extends State<ProfileSchoolPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SekolahProvider>(
        context,
        listen: false,
      ).getSingleSekolah(widget.id);
      Provider.of<SekolahProvider>(
        context,
        listen: false,
      ).getCountStudents(widget.id);
      Provider.of<SekolahProvider>(
        context,
        listen: false,
      ).getCountTeachers(widget.id);
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
          "Profil Sekolah",
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
      body: Consumer<SekolahProvider>(builder: (context, value, index) {
        final sekolah = value.singleSekolah;
        final siswa = value.siswa;
        final guru = value.guru;

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
              defaultPadding,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        onBackgroundImageError: (exception, stackTrace) {},
                        backgroundImage: NetworkImage(
                            "${global.imageBaseURL}/${sekolah?.image}"),
                        radius: 50,
                        backgroundColor: secondaryGreen,
                        child: sekolah?.image == ""
                            ? Icon(
                                Icons.person,
                                size: 40,
                                color: white,
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
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
                          title: "NSS",
                          value: sekolah?.nss,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "NPSN",
                          value: sekolah?.npsn,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Nama Sekolah",
                          value: sekolah?.nama,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Alamat",
                          value: sekolah?.alamat,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "RT",
                          value: sekolah?.rt,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "RW",
                          value: sekolah?.rw,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "No. Telpon",
                          value: sekolah?.noTelpon,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "No. Fax",
                          value: sekolah?.noFax,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Lintang/Bujur",
                          value: sekolah?.latLong,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Alamat Email",
                          value: sekolah?.email,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Kepala Sekolah",
                          value: sekolah?.kepalaSekolah,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.0,
                    children: [
                      // CardButtonWidget(
                      //   title: "Guru",
                      //   page: TeacherPage(),
                      // ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(
                            defaultBorderRadius,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tenaga Pengajar",
                              style: primaryTextStyle.copyWith(
                                fontSize: 20,
                                color: white,
                              ),
                            ),
                            Text(
                              "${guru?.jumlah}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(
                            defaultBorderRadius,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Total Siswa",
                              style: primaryTextStyle.copyWith(
                                fontSize: 20,
                                color: white,
                              ),
                            ),
                            Text(
                              "${siswa?.jumlah}",
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CardButtonWidget(
                        title: "Jurusan",
                        page: JurusanPage(
                          id: widget.id,
                        ),
                      ),
                      CardButtonWidget(
                        title: "Prestasi",
                        page: PrestasiPage(
                          id: widget.id,
                        ),
                      ),
                      CardButtonWidget(
                        title: "Fasilitas",
                        page: FasilitasPage(
                          id: widget.id,
                        ),
                      ),
                      CardButtonWidget(
                        title: "Galeri",
                        page: GaleriPage(
                          id: widget.id,
                        ),
                      ),
                      // CardButtonWidget(
                      //   title: "Kurikulum",
                      //   page: KurikulumPage(
                      //     id: widget.id,
                      //   ),
                      // ),
                      // const CardButtonWidget(
                      //   title: "Ekstrakulikuler",
                      //   page: EkstrakulikulerPage(),
                      // ),
                      // CardButtonWidget(
                      //   title: "Siswa",
                      //   page: SiswaPage(),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CardButtonWidget(
                    title: "Ekstrakulikuler",
                    page: EkstrakulikulerPage(
                      id: widget.id,
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
