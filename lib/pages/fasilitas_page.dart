import 'package:de_profile_public/pages/fasilitas_detail_page.dart';
import 'package:de_profile_public/providers/fasilitas_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';

class FasilitasPage extends StatefulWidget {
  final int? id;
  const FasilitasPage({
    super.key,
    required this.id,
  });

  @override
  State<FasilitasPage> createState() => _FasilitasPageState();
}

class _FasilitasPageState extends State<FasilitasPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FasilitasProvider>(
        context,
        listen: false,
      ).getAllFasilitas(widget.id);
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
          "Fasilitas",
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
      body: Consumer<FasilitasProvider>(builder: (context, value, child) {
        final fasilitas = value.fasilitas;

        return SafeArea(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: fasilitas.length,
              itemBuilder: (context, index) {
                final dataFasilitas = fasilitas[index];

                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: defaultPadding),
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: FasilitasDetailPage(id: dataFasilitas.id,),
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
                    dataFasilitas.nama.toString(),
                    style: primaryTextStyle,
                  ),
                  subtitle: Text(
                    dataFasilitas.jenis.toString(),
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
