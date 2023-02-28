import 'package:de_profile_public/pages/kurikulum_detail_page.dart';
import 'package:de_profile_public/providers/kurikulum_provider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../common/theme.dart';

class KurikulumPage extends StatefulWidget {
  final int? id;
  const KurikulumPage({
    super.key,
    required this.id,
  });

  @override
  State<KurikulumPage> createState() => _KurikulumPageState();
}

class _KurikulumPageState extends State<KurikulumPage> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<KurikulumProvider>(
        context,
        listen: false,
      ).getAllKurikulum(widget.id);
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
            "Kurikulum",
            style: primaryTextStyle.copyWith(
              fontSize: 25,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: defaultPadding),
              child: CircleAvatar(
                backgroundColor: secondaryGreen,
                child: const FlutterLogo(),
              ),
            )
          ],
        ),
        body: Consumer<KurikulumProvider>(
          builder: (context, value, child) {
            final kurikulum = value.kurikulum;

            return SafeArea(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: kurikulum.length,
                  itemBuilder: (context, index) {
                    final dataKurikulum = kurikulum[index];

                    return ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: defaultPadding),
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            child: const KurikulumDetailPage(),
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
                        dataKurikulum.kurikulum.toString(),
                        style: primaryTextStyle,
                      ),
                      subtitle: Text(
                        dataKurikulum.keterangan.toString(),
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
        ));
  }
}
