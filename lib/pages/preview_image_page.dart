import 'dart:io';
import 'package:de_profile_public/common/theme.dart';
import 'package:de_profile_public/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PreviewImagePage extends StatefulWidget {
  final File? file;
  final String type;
  const PreviewImagePage({
    super.key,
    required this.file,
    required this.type,
  });

  @override
  State<PreviewImagePage> createState() => _PreviewImagePageState();
}

class _PreviewImagePageState extends State<PreviewImagePage> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    double width = MediaQuery.of(context).size.width;

    addProfilePicture() async {
      if (await userProvider.addProfilePicture(widget.file)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryGreen,
            content: Text(
              "Berhasil Menambahkan Foto Profil!",
              style: primaryTextStyle.copyWith(
                color: white,
              ),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(
              "Gagal Menambahkan Foto Profil!",
              style: primaryTextStyle.copyWith(
                color: white,
              ),
            ),
          ),
        );
      }
    }

    editProfilePicture() async {
      if (await userProvider.editProfilePicture(widget.file)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryGreen,
            content: Text(
              "Berhasil Mengubah Foto Profil!",
              style: primaryTextStyle.copyWith(
                color: white,
              ),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(
              "Gagal Mengubah Foto Profil!",
              style: primaryTextStyle.copyWith(
                color: white,
              ),
            ),
          ),
        );
      }
    }

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
          "Pratinjau Foto Profil",
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
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: secondaryGreen,
                        borderRadius: BorderRadius.circular(
                          defaultBorderRadius,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          defaultBorderRadius,
                        ),
                        child: Image.file(
                          widget.file!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    widget.type == "tambah"
                        ? SizedBox(
                            width: width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                ),
                              ),
                              onPressed: addProfilePicture,
                              child: value.isLoading == true
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: white,
                                          strokeWidth: 3,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Simpan",
                                      style: primaryTextStyle.copyWith(
                                        color: white,
                                      ),
                                    ),
                            ),
                          )
                        : SizedBox(
                            width: width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                ),
                              ),
                              onPressed: editProfilePicture,
                              child: value.isLoading == true
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: white,
                                          strokeWidth: 3,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Simpan",
                                      style: primaryTextStyle.copyWith(
                                        color: white,
                                      ),
                                    ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
