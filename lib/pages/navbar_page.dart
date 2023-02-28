import 'package:de_profile_public/pages/profile_user_page.dart';
import 'package:flutter/material.dart';
import '../common/theme.dart';
import 'dashboard_page.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    DashboardPage(),
    ProfileUserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          pages.elementAt(currentIndex),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Align(
              alignment: const Alignment(
                0.0,
                1.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: grey.withOpacity(0.3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: white,
                    currentIndex: currentIndex,
                    selectedItemColor: primaryGreen,
                    unselectedItemColor: grey,
                    selectedLabelStyle: primaryTextStyle.copyWith(
                      color: primaryGreen,
                    ),
                    unselectedLabelStyle: primaryTextStyle.copyWith(
                      color: black,
                    ),
                    onTap: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(
                          currentIndex == 0
                              ? Icons.dashboard_rounded
                              : Icons.dashboard_outlined,
                        ),
                        label: "Beranda",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          currentIndex == 1
                              ? Icons.person_rounded
                              : Icons.person_outlined,
                        ),
                        label: "Profil",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
