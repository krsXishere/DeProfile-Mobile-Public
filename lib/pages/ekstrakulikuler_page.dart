import 'package:de_profile_public/providers/ekstrakulikuler_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';

class EkstrakulikulerPage extends StatefulWidget {
  final int? id;
  const EkstrakulikulerPage({
    super.key,
    required this.id,
  });

  @override
  State<EkstrakulikulerPage> createState() => _EkstrakulikulerPageState();
}

class _EkstrakulikulerPageState extends State<EkstrakulikulerPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EkstrakulikulerProvider>(
        context,
        listen: false,
      ).getAllEkstrakulikuler(widget.id);
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
          "Ekstrakulikuler",
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
      body: Consumer<EkstrakulikulerProvider>(
        builder: (context, value, child) {
          final ekstrakulikuler = value.ekstrakulikuler;

          return SafeArea(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: ekstrakulikuler.length,
                itemBuilder: (context, index) {
                  final dataEkstrakulikuler = ekstrakulikuler[index];

                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: defaultPadding),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        defaultBorderRadius,
                      ),
                    ),
                    title: Text(
                      dataEkstrakulikuler.nama.toString(),
                      style: primaryTextStyle,
                    ),
                    subtitle: Text(
                      "Jenis: ${dataEkstrakulikuler.jenis.toString()}",
                      style: primaryTextStyle,
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
