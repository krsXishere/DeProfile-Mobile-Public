import 'package:de_profile_public/common/theme.dart';
import 'package:de_profile_public/pages/register_page.dart';
import 'package:de_profile_public/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'navbar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    login() async {
      if (await authProvider.login(
        emailController.text,
        passwordController.text,
      )) {
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: const NavbarPage(),
            type: PageTransitionType.rightToLeft,
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(
              "Gagal masuk!",
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
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/logo-1.svg",
                          color: primaryGreen,
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Text(
                          "De'Profile",
                          style: primaryTextStyle.copyWith(
                            color: primaryGreen,
                            fontWeight: light,
                            fontSize: 50,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      style: primaryTextStyle,
                      cursorColor: secondaryGreen,
                      cursorHeight: 20,
                      cursorWidth: 3,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        filled: false,
                        border: InputBorder.none,
                        hintText: "Masukkan email",
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
                      obscureText: value.isObsecure,
                      cursorColor: secondaryGreen,
                      cursorHeight: 20,
                      cursorWidth: 3,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            value.checkObsecure();
                          },
                          child: Icon(
                            value.isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color:
                                value.isObsecure ? unClickColor : primaryGreen,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        filled: false,
                        border: InputBorder.none,
                        hintText: "Masukkan password",
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
                        onPressed: login,
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
                                "Masuk",
                                style: primaryTextStyle.copyWith(
                                  color: white,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun?",
                          style: primaryTextStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              PageTransition(
                                child: const RegisterPage(),
                                type: PageTransitionType.rightToLeft,
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text(
                            "Daftar sekarang",
                            style: primaryTextStyle.copyWith(
                              color: secondaryGreen,
                            ),
                          ),
                        ),
                      ],
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
