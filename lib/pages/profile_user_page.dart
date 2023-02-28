import 'dart:io';
// import 'package:de_profile_public/models/user_model.dart';
import 'package:de_profile_public/pages/preview_image_page.dart';
import 'package:de_profile_public/pages/settings_page.dart';
import 'package:de_profile_public/providers/user_provider.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../common/theme.dart';
// import '../providers/auth_provider.dart';
import '../widget/listtile_profile_school_widget.dart';
import '../common/globals.dart' as global;

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  File? file;
  Future<void> getImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);

    setState(() {
      this.file = file;
    });
  }

  Future<void> getImageFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);
    File file = File(image!.path);

    setState(() {
      this.file = file;
    });
  }

  void showModalDialogEditProfilePicture() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          defaultBorderRadius,
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: unClickColor,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryGreen,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: IconButton(
                          splashRadius: 30,
                          onPressed: () {
                            getImageFromCamera().then((value) {
                              if (file != null) {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: PreviewImagePage(
                                      file: file,
                                      type: "edit",
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: redColor,
                                    content: Text(
                                      "Edit Foto Dibatalkan!",
                                      style: primaryTextStyle.copyWith(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          icon: Icon(
                            Icons.camera_enhance_rounded,
                            color: secondaryGreen,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Kamera",
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryGreen,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: IconButton(
                          splashRadius: 30,
                          onPressed: () {
                            getImageFromGallery().then((value) {
                              if (file != null) {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: PreviewImagePage(
                                      file: file,
                                      type: "edit",
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: redColor,
                                    content: Text(
                                      "Edit Foto Dibatalkan!",
                                      style: primaryTextStyle.copyWith(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: secondaryGreen,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Galeri",
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showModalDialogAddProfilePicture() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          defaultBorderRadius,
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: unClickColor,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryGreen,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: IconButton(
                          splashRadius: 30,
                          onPressed: () {
                            getImageFromCamera().then((value) {
                              if (file != null) {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: PreviewImagePage(
                                      file: file,
                                      type: "tambah",
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: redColor,
                                    content: Text(
                                      "Tambah Foto Dibatalkan!",
                                      style: primaryTextStyle.copyWith(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          icon: Icon(
                            Icons.camera_enhance_rounded,
                            color: secondaryGreen,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Kamera",
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryGreen,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: IconButton(
                          splashRadius: 30,
                          onPressed: () {
                            getImageFromGallery().then((value) {
                              if (file != null) {
                                Navigator.of(context).push(
                                  PageTransition(
                                    child: PreviewImagePage(
                                      file: file,
                                      type: "tambah",
                                    ),
                                    type: PageTransitionType.rightToLeft,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: redColor,
                                    content: Text(
                                      "Tambah Foto Dibatalkan!",
                                      style: primaryTextStyle.copyWith(
                                        color: white,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            });
                          },
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: secondaryGreen,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Text(
                        "Galeri",
                        style: primaryTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(
        context,
        listen: false,
      ).getUserProfile();
    });
    // AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // UserModel? user = authProvider.user;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: defaultPadding),
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
        title: Text(
          "Profil Anda",
          style: primaryTextStyle.copyWith(
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              tooltip: "Pengaturan Akun",
              splashRadius: 20,
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: const SettingsPage(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              icon: Icon(
                Icons.settings_rounded,
                color: secondaryGreen,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final user = value.user;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              onBackgroundImageError:
                                  (exception, stackTrace) {},
                              backgroundImage: NetworkImage(
                                  "${global.imageBaseURL}/${user?.image}"),
                              backgroundColor: secondaryGreen,
                              child: user?.image == null
                                  ? Icon(
                                      Icons.person,
                                      size: 40,
                                      color: white,
                                    )
                                  : const SizedBox(),
                            ),
                            user?.image == null
                                ? Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: showModalDialogAddProfilePicture,
                                      child: CircleAvatar(
                                        backgroundColor: primaryGreen,
                                        radius: 15,
                                        child: Icon(
                                          user?.image == null
                                              ? Icons.add_rounded
                                              : Icons.mode_edit_outline_rounded,
                                          color: white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                : Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: showModalDialogEditProfilePicture,
                                      child: CircleAvatar(
                                        backgroundColor: primaryGreen,
                                        radius: 15,
                                        child: Icon(
                                          user?.image == null
                                              ? Icons.add_rounded
                                              : Icons.mode_edit_outline_rounded,
                                          color: white,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
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
                            title: "Nama",
                            value: user?.name,
                          ),
                          ListTileProfileSchoolWidget(
                            title: "Alamat Email",
                            value: user?.email,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: SizedBox(
        height: height * 0.4,
        width: double.infinity,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [primaryGreen, secondaryGreen],
              [secondaryGreen, primaryGreen],
            ],
            durations: [
              3500,
              5000,
            ],
            heightPercentages: [
              0.20,
              0.30,
            ],
          ),
          // waveAmplitude: 0,
          size: const Size(
            double.infinity,
            400,
          ),
        ),
      ),
    );
  }
}
