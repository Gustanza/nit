import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nit_all_in_one/destinations/splash.dart';
import 'package:nit_all_in_one/utils/colors.dart';
import 'package:nit_all_in_one/utils/strings.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const NITAPP());
}

class NITAPP extends StatelessWidget {
  const NITAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: mainFont,
        drawerTheme: DrawerThemeData(backgroundColor: lightBack),
        scaffoldBackgroundColor: lightBack,
      ),
      darkTheme: ThemeData(
        fontFamily: mainFont,
        colorScheme: const ColorScheme.dark(),
      ),
      home: const NITSplash(),
    );
  }
}
