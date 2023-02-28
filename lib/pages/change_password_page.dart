import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';
import '../providers/user_provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    double width = MediaQuery.of(context).size.width;

    changePassword() async {
      if (await userProvider.changePassword(
        oldPasswordController.text,
        newPasswordController.text,
        confirmNewPasswordController.text,
      )) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryGreen,
            content: Text(
              "Berhasil Ubah Kata Sandi!",
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
              "Gagal Ubah Kata Sandi!",
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
            "Ubah Kata Sandi",
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      TextFormField(
                        style: primaryTextStyle,
                        cursorColor: secondaryGreen,
                        cursorHeight: 20,
                        cursorWidth: 3,
                        controller: oldPasswordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          filled: false,
                          border: InputBorder.none,
                          hintText: "Masukkan kata sandi lama",
                          hintStyle: primaryTextStyle.copyWith(
                            fontWeight: regular,
                            color: grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: unClickColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: unClickColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        style: primaryTextStyle,
                        cursorColor: secondaryGreen,
                        cursorHeight: 20,
                        cursorWidth: 3,
                        controller: newPasswordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          filled: false,
                          border: InputBorder.none,
                          hintText: "Masukkan kata sandi baru",
                          hintStyle: primaryTextStyle.copyWith(
                            fontWeight: regular,
                            color: grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: unClickColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: unClickColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      TextFormField(
                        style: primaryTextStyle,
                        cursorColor: secondaryGreen,
                        cursorHeight: 20,
                        cursorWidth: 3,
                        controller: confirmNewPasswordController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          filled: false,
                          border: InputBorder.none,
                          hintText: "Konfirmasi kata sandi baru",
                          hintStyle: primaryTextStyle.copyWith(
                            fontWeight: regular,
                            color: grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: unClickColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: unClickColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      SizedBox(
                        width: width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                            ),
                          ),
                          onPressed: changePassword,
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
        ));
  }
}
