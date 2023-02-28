import 'package:de_profile_public/pages/prestasi_detail_page.dart';
import 'package:de_profile_public/providers/prestasi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';

class PrestasiPage extends StatefulWidget {
  final int? id;
  const PrestasiPage({
    super.key,
    required this.id,
  });

  @override
  State<PrestasiPage> createState() => _PrestasiPageState();
}

class _PrestasiPageState extends State<PrestasiPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PrestasiProvider>(
        context,
        listen: false,
      ).getAllPrestasi(widget.id);
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
          "Prestasi",
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
      body: Consumer<PrestasiProvider>(
        builder: (context, value, child) {
          final prestasi = value.prestasi;

          return SafeArea(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: prestasi.length,
                itemBuilder: (context, index) {
                  final dataPrestasi = prestasi[index];

                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: defaultPadding),
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          child: PrestasiDetailPage(
                            id: dataPrestasi.id,
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
                      dataPrestasi.nama.toString(),
                      style: primaryTextStyle,
                    ),
                    subtitle: Text(
                      "Tingkat ${dataPrestasi.tingkat.toString()}",
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
        },
      ),
    );
  }
}
