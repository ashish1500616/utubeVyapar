import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentUserName =
        FirebaseAuth.instance.currentUser!.displayName.toString();
    currentUserName = currentUserName[0].toUpperCase() +
        currentUserName.substring(1).toLowerCase();
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: _mediaQuery.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hello , $currentUserName',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () => {print("Tapped"), Get.toNamed('/watchVideo')},
                child: Container(
                  width: _mediaQuery.width * 0.5,
                  child: Column(
                    children: [
                      Card(
                        child: Image.asset(
                          "assets/images/watch_video.jpg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Text(
                        "Watch Videos",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  width: _mediaQuery.width * 0.5,
                  child: Column(
                    children: [
                      Card(
                        child: Image.asset(
                          "assets/images/watch_video.jpg",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      const Text(
                        "Create Campaign",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
