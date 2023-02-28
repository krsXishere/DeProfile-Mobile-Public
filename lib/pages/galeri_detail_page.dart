import 'package:de_profile_public/providers/galeri_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../common/theme.dart';
import '../widget/listtile_profile_school_widget.dart';
import '../common//globals.dart' as global;

class GaleriDetailPage extends StatefulWidget {
  final int? id;
  const GaleriDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<GaleriDetailPage> createState() => _GaleriDetailPageState();
}

class _GaleriDetailPageState extends State<GaleriDetailPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GaleriProvider>(
        context,
        listen: false,
      ).getSingleGaleri(widget.id);
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
            "Detail Galeri",
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
        body: Consumer<GaleriProvider>(
          builder: (context, value, child) {
            final galeri = value.singleGaleri;

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(
                  defaultPadding,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      value.isLoading == true
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              child: Shimmer(
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: unClickColor),
                                  width: double.infinity,
                                  height: 200,
                                ),
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(defaultBorderRadius),
                                child: Image.network(
                                  "${global.imageBaseURL}/${galeri?.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(
                            defaultBorderRadius,
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTileProfileSchoolWidget(
                              title: "Judul",
                              value: galeri?.judul,
                            ),
                            ListTileProfileSchoolWidget(
                              title: "Deskripsi",
                              value: galeri?.deskripsi,
                            ),
                          ],
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
