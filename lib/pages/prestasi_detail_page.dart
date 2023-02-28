import 'package:de_profile_public/providers/prestasi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../common/theme.dart';
import '../widget/listtile_profile_school_widget.dart';

class PrestasiDetailPage extends StatefulWidget {
  final int? id;
  const PrestasiDetailPage({super.key, required this.id});

  @override
  State<PrestasiDetailPage> createState() => _PrestasiDetailPageState();
}

class _PrestasiDetailPageState extends State<PrestasiDetailPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PrestasiProvider>(
        context,
        listen: false,
      ).getSinglePrestasi(widget.id);
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
          "Detail Prestasi",
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
      body: Consumer<PrestasiProvider>(builder: (context, value, child) {
        final prestasi = value.singlePrestasi;

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(
              defaultPadding,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
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
                          title: "Nama Prestasi",
                          value: prestasi?.nama,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Jenis Prestasi",
                          value: prestasi?.jenisPrestasi,
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Tingkat",
                          value: "Tingkat ${prestasi?.tingkat}",
                        ),
                        ListTileProfileSchoolWidget(
                          title: "Keterangan",
                          value: prestasi?.keterangan,
                        ),
                      ],
                    ),
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
