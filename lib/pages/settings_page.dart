import 'package:de_profile_public/common/theme.dart';
import 'package:de_profile_public/pages/change_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import 'edit_profile_user.dart';
import 'login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(
        context,
        listen: false,
      ).getUserProfile();
    });
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    logout() async {
      if (await authProvider.logout()) {
        Navigator.of(context).pop();
        Navigator.pushAndRemoveUntil(
          context,
          PageTransition(
            child: const LoginPage(),
            type: PageTransitionType.rightToLeft,
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryGreen,
            content: Text(
              "Gagal logout!",
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
          "Pengaturan Akun",
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
      body: Consumer2<AuthProvider, UserProvider>(
        builder: (context, authProvider, userProvider, child) {
          final user = userProvider.user;

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryGreen,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: EditProfilePage(
                              name: user?.name,
                              email: user?.email,
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          "Edit Profil",
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            color: white,
                          ),
                        ),
                        trailing: Icon(
                          Icons.edit_rounded,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryGreen,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const ChangePasswordPage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          "Ubah Kata Sandi",
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            color: white,
                          ),
                        ),
                        trailing: Icon(
                          Icons.lock,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: redColor,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              alignment: AlignmentDirectional.center,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  defaultBorderRadius,
                                ),
                              ),
                              title: CircleAvatar(
                                radius: 30,
                                backgroundColor: redColor,
                                child: Icon(
                                  Icons.logout_rounded,
                                  color: white,
                                ),
                              ),
                              content: Text(
                                "Anda akan keluar?",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      backgroundColor: white,
                                      side: BorderSide(color: redColor),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          defaultBorderRadius,
                                        ),
                                      ),
                                    ),
                                    onPressed: logout,
                                    child: Text(
                                      "Keluar",
                                      style: primaryTextStyle.copyWith(
                                        color: redColor,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      backgroundColor: white,
                                      side: BorderSide(color: primaryGreen),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          defaultBorderRadius,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Batal",
                                      style: primaryTextStyle.copyWith(
                                        color: primaryGreen,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: Text(
                          "Keluar",
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            color: white,
                          ),
                        ),
                        trailing: Icon(
                          Icons.logout_rounded,
                          color: white,
                        ),
                      ),
                    ),
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
