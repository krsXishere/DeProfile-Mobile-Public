import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';
import '../providers/user_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfilePage extends StatefulWidget {
  final String? name, email;
  const EditProfilePage({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    setState(() {
      nameController.text = widget.name.toString();
      emailController.text = widget.email.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    double width = MediaQuery.of(context).size.width;

    updateUserProfile() async {
      if (await userProvider.updateUserProfile(
        nameController.text,
        emailController.text,
      )) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryGreen,
            content: Text(
              "Profil Berhasil Diupdate!",
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
              "Gagal Edit Data!",
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
          "Edit Profil",
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
                        onPressed: updateUserProfile,
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
