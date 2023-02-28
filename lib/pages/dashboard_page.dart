import 'package:de_profile_public/common/theme.dart';
import 'package:de_profile_public/pages/profile_school_page.dart';
import 'package:de_profile_public/providers/sekolah_provider.dart';
import 'package:de_profile_public/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../common/globals.dart' as global;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SekolahProvider>(
        context,
        listen: false,
      ).getAllSekolah();
      Provider.of<UserProvider>(
        context,
        listen: false,
      ).getUserProfile();
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          "De'Profile",
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
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
      body: Consumer2<SekolahProvider, UserProvider>(
        builder: (context, value, value2, child) {
          final sekolahs = value.sekolah;
          // final user = value2.user;

          return SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     top: defaultBorderRadius,
                  //     left: defaultPadding,
                  //   ),
                  //   child: Text(
                  //     "Hai, ${user!.name!.contains(" ") ? user.name?.substring(0, user.name?.indexOf(" ")) : user.name}",
                  //     style: primaryTextStyle.copyWith(
                  //       fontSize: 20,
                  //       fontWeight: bold,
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: TextFormField(
                      onFieldSubmitted: ((data) {
                        // data = value.toString();
                        value.getSearchSekolah(data);
                      }),
                      style: primaryTextStyle,
                      cursorColor: secondaryGreen,
                      cursorHeight: 20,
                      cursorWidth: 3,
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            value.getSearchSekolah(searchController.text);
                          },
                          child: Icon(
                            Icons.search,
                            color: primaryGreen,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        filled: true,
                        border: InputBorder.none,
                        hintText: "Cari Sekolah",
                        hintStyle: primaryTextStyle.copyWith(
                          fontWeight: regular,
                          color: grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          borderSide: BorderSide(
                            color: unClickColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          borderSide: BorderSide(
                            color: unClickColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding,
                      bottom: defaultPadding,
                    ),
                    child: Text(
                      "Daftar Profil Sekolah",
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  value.isLoading == true
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: CircularProgressIndicator(
                                    color: primaryGreen,
                                    strokeWidth: 3,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: primaryGreen,
                                  child: SvgPicture.asset(
                                    "assets/svg/logo-1.svg",
                                    color: white,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: sekolahs.length,
                          itemBuilder: ((context, index) {
                            final sekolah = sekolahs[index];

                            return ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: ProfileSchoolPage(
                                      id: sekolah.id,
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  defaultBorderRadius,
                                ),
                              ),
                              leading: CircleAvatar(
                                backgroundColor: secondaryGreen,
                                backgroundImage: NetworkImage(
                                  "${global.imageBaseURL}/${sekolah.image}",
                                ),
                                onBackgroundImageError:
                                    (exception, stackTrace) {},
                                child: sekolah.image == ""
                                    ? Icon(
                                        Icons.business_rounded,
                                        color: white,
                                      )
                                    : const SizedBox(),
                              ),
                              title: Text(
                                sekolah.nama.toString(),
                                style: primaryTextStyle,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              ),
                            );
                          }),
                        ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
