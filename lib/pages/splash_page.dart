import 'dart:async';
import 'package:de_profile_public/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/theme.dart';
import '../pages/navbar_page.dart';
import '../widget/reveal_route_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? timer;

  void nextPage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    timer = Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          RevealRoute(
            page: token != null ? const NavbarPage() : const LoginPage(),
            maxRadius: 800,
            centerAlignment: Alignment.center,
          ),
        );
      },
    );
  }

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGreen,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: CircularProgressIndicator(
                color: white,
                strokeWidth: 3,
              ),
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: white,
              child: SvgPicture.asset(
                "assets/svg/logo-1.svg",
                color: primaryGreen,
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
