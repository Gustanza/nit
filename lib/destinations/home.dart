import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nit_all_in_one/destinations/drawer.dart';
import 'package:nit_all_in_one/utils/strings.dart';
import 'package:nit_all_in_one/utils/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  AdManagerBannerAd? _bannerAd;
  final adUnitId = "ca-app-pub-1111890368760723/5167581093";

  @override
  void initState() {
    loadAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: Text(appname),
      ),
      drawer: const Drauwer(),
      bottomSheet: _bannerAd != null
          ? SizedBox(
              width: double.infinity,
              height: 50,
              child: AdWidget(ad: _bannerAd!))
          : const SizedBox(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CupertinoListSection.insetGrouped(
            backgroundColor: Colors.transparent,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage(logow),
                ),
              ),
              ListTile(
                title: const Text("NIT Official Site"),
                onTap: () async {
                  try {
                    await launchUrl(nhome);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("Sims Login"),
                onTap: () async {
                  try {
                    await launchUrl(sims);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("Nit Billing System"),
                onTap: () async {
                  try {
                    await launchUrl(nbs);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("Online Application"),
                onTap: () async {
                  try {
                    await launchUrl(oas);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("Sims Short Courses"),
                onTap: () async {
                  try {
                    await launchUrl(sca);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("Journal of logistics"),
                onTap: () async {
                  try {
                    await launchUrl(jol);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("Cabin Crew Application"),
                onTap: () async {
                  try {
                    await launchUrl(cca);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("NIT (All-In-One) Privacy Policy"),
                onTap: () async {
                  try {
                    await launchUrl(nprivacy);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
              ListTile(
                title: const Text("Disclaimer Information"),
                onTap: () async {
                  try {
                    await launchUrl(ndisc);
                  } catch (err) {
                    mesenja(err.toString());
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  mesenja(String mesej) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mesej)));
  }

  void loadAd() {
    _bannerAd = AdManagerBannerAd(
      sizes: [AdSize.banner],
      adUnitId: adUnitId,
      request: const AdManagerAdRequest(),
      listener: AdManagerBannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {});
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('AdManagerBannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }
}
