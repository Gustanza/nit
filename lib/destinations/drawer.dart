import 'package:flutter/material.dart';
import 'package:nit_all_in_one/utils/strings.dart';
import 'package:nit_all_in_one/utils/urls.dart';
import 'package:url_launcher/url_launcher.dart';

class Drauwer extends StatelessWidget {
  const Drauwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage(logow),
              ),
              const SizedBox(height: 6),
              Text(
                appname,
                style: TextStyle(fontFamily: boldFont),
              )
            ],
          )),
          ListTile(
            title: const Text("About Developer"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () async {
              try {
                await launchUrl(pshome);
              } catch (err) {
                print(err.toString());
              }
            },
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          ListTile(
            title: const Text("Download Chiriku AI"),
            trailing: const Icon(Icons.arrow_right),
            onTap: () async {
              try {
                await launchUrl(chiriku);
              } catch (err) {
                print(err.toString());
              }
            },
          ),
          const Divider(
            thickness: 1,
            height: 0,
          )
        ],
      ),
    );
  }
}
