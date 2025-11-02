import 'package:flutter/material.dart';

import '../../../core/const/AppAssets.dart';

class DrawerSheet extends StatelessWidget {
  const DrawerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.primaryColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(color: Colors.white),
            child: const Center(
                child: Text(
              "News App",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Image.asset(
                  AppAssets.home_icon,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Go To Home",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 3,
            thickness: 3,
            endIndent: 20,
            indent: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Image.asset(
                  AppAssets.paint_icon,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Them",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 3,
            thickness: 3,
            endIndent: 20,
            indent: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Image.asset(
                  AppAssets.earth_icon,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Language",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 3,
            thickness: 3,
            endIndent: 20,
            indent: 20,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
