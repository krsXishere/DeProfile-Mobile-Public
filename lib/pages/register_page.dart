import 'package:de_profile_public/pages/login_page.dart';
import 'package:de_profile_public/pages/navbar_page.dart';
import 'package:de_profile_public/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;

    register() async {
      if (await authProvider.register(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
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
              "Gagal mendaftar!",
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
      body: Consumer<AuthProvider>(builder: (context, value, index) {
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
                          fontWeight: medium,
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
                    controller: nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      filled: false,
                      border: InputBorder.none,
                      hintText: "Masukkan nama",
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
                    obscureText: value.isObsecure2,
                    cursorColor: secondaryGreen,
                    cursorHeight: 20,
                    cursorWidth: 3,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          value.checkObsecure2();
                        },
                        child: Icon(
                          value.isObsecure2
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              value.isObsecure2 ? unClickColor : primaryGreen,
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
                  TextFormField(
                    style: primaryTextStyle,
                    obscureText: value.isObsecure3,
                    cursorColor: secondaryGreen,
                    cursorHeight: 20,
                    cursorWidth: 3,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          value.checkObsecure3();
                        },
                        child: Icon(
                          value.isObsecure3
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color:
                              value.isObsecure3 ? unClickColor : primaryGreen,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      filled: false,
                      border: InputBorder.none,
                      hintText: "Masukkan konfirmasi password",
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
                      onPressed: register,
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
                              "Daftar",
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
                        "Sudah punya akun?",
                        style: primaryTextStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            PageTransition(
                              child: const LoginPage(),
                              type: PageTransitionType.rightToLeft,
                            ),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Text(
                          "Masuk sekarang",
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
      }),
    );
  }
}
