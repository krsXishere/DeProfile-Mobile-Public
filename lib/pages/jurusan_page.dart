import 'package:de_profile_public/pages/jurusan_detail_page.dart';
import 'package:de_profile_public/providers/jurusan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';

class JurusanPage extends StatefulWidget {
  final int? id;
  const JurusanPage({
    super.key,
    required this.id,
  });

  @override
  State<JurusanPage> createState() => _JurusanPageState();
}

class _JurusanPageState extends State<JurusanPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<JurusanProvider>(
        context,
        listen: false,
      ).getAllJurusan(widget.id);
    });

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
          "Jurusan",
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
      body: Consumer<JurusanProvider>(builder: (context, value, child) {
        final jurusan = value.jurusan;

        return SafeArea(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: jurusan.length,
              itemBuilder: (context, index) {
                final dataJurusan = jurusan[index];

                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: defaultPadding),
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: JurusanDetailPage(
                          id: dataJurusan.id,
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
                  title: Text(
                    dataJurusan.jurusan.toString(),
                    style: primaryTextStyle,
                  ),
                  subtitle: Text(
                    dataJurusan.keterangan.toString(),
                    style: primaryTextStyle,
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: black,
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }
}
