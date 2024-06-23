import 'package:flutter/material.dart';
import 'package:nit_all_in_one/destinations/home.dart';
import 'package:nit_all_in_one/utils/strings.dart';

class NITSplash extends StatefulWidget {
  const NITSplash({super.key});

  @override
  State<NITSplash> createState() => _NITSplashState();
}

class _NITSplashState extends State<NITSplash> {
  @override
  void initState() {
    initAlt();
    super.initState();
  }

  initAlt() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Main(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          appname,
          style: TextStyle(
            fontSize: 24,
            fontFamily: boldFont,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Text(llcname),
    );
  }
}
