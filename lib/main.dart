// import 'package:de_profile_public/pages/login_page.dart';
// import 'package:de_profile_public/pages/navbar_page.dart';
import 'package:de_profile_public/pages/splash_page.dart';
import 'package:de_profile_public/providers/auth_provider.dart';
import 'package:de_profile_public/providers/ekstrakulikuler_provider.dart';
import 'package:de_profile_public/providers/fasilitas_provider.dart';
import 'package:de_profile_public/providers/galeri_provider.dart';
import 'package:de_profile_public/providers/jurusan_provider.dart';
import 'package:de_profile_public/providers/kurikulum_provider.dart';
import 'package:de_profile_public/providers/prestasi_provider.dart';
import 'package:de_profile_public/providers/sekolah_provider.dart';
import 'package:de_profile_public/providers/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SekolahProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JurusanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PrestasiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FasilitasProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GaleriProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KurikulumProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EkstrakulikulerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        );
      }),
    );
  }
}
