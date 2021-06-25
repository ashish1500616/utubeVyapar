import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utubevyappar/controller/home_page_controller.dart';
import 'package:utubevyappar/views/create_campaign.dart';
import 'package:utubevyappar/views/user_information.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    String currentUserName =
        FirebaseAuth.instance.currentUser!.displayName.toString();
    currentUserName = currentUserName[0].toUpperCase() +
        currentUserName.substring(1).toLowerCase();
    final _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("UtubeVyapar"),
        leading: const Icon(Icons.monetization_on_outlined),
        backgroundColor: Colors.deepOrange.shade200,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hello, $currentUserName',
                      overflow: TextOverflow.ellipsis,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => {
                      print("Tapped"),
                      Get.toNamed('/watchVideo'),
                    },
                    child: Container(
                      width: _mediaQuery.width * 0.5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Card(
                              child: Image.asset(
                                "assets/images/watch_video.png",
                                fit: BoxFit.contain,
                                height: 150,
                                width: 200,
                              ),
                            ),
                          ),
                          const Text(
                            "Watch Videos",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.bottomSheet(
                        CreateCampaign(),
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                      );
                    },
                    child: Container(
                      width: _mediaQuery.width * 0.5,
                      child: Column(
                        children: [
                          Card(
                            child: Image.asset(
                              "assets/images/video_campaign.png",
                              fit: BoxFit.contain,
                              height: 150,
                              width: 200,
                            ),
                          ),
                          const Text(
                            "Create Campaign",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: AdWidget(ad: homePageController.bannerAd),
                width: homePageController.bannerAd.size.width.toDouble(),
                height: homePageController.bannerAd.size.height.toDouble(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Get.toNamed("/userInformation");
                      Get.bottomSheet(UserInformation(),
                          isScrollControlled: true,
                          backgroundColor: Colors.white);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: _mediaQuery.height * 0.3,
                      width: _mediaQuery.width * 0.3,
                      child: Column(
                        children: [
                          Card(
                            child: Image.asset(
                              "assets/images/youtube.png",
                              fit: BoxFit.contain,
                              height: 100,
                              width: 200,
                            ),
                          ),
                          const Text(
                            "Promote Your Channel",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Opening telegram channel.");
                      launch("https://t.me/joinchat/gbJk-jKQPMxiMzc1",
                          forceSafariVC: false);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: _mediaQuery.height * 0.3,
                      width: _mediaQuery.width * 0.3,
                      child: Column(
                        children: [
                          Card(
                            child: Image.asset(
                              "assets/images/telegram.png",
                              fit: BoxFit.contain,
                              height: 100,
                              width: 200,
                            ),
                          ),
                          const Text(
                            "Join On Telegram",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Opening telegram channel.");
                      launch("https://t.me/joinchat/gbJk-jKQPMxiMzc1",
                          forceSafariVC: false);
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: _mediaQuery.height * 0.3,
                      width: _mediaQuery.width * 0.3,
                      child: Column(
                        children: [
                          Card(
                            child: Image.asset(
                              "assets/images/collab.png",
                              fit: BoxFit.contain,
                              height: 100,
                              width: 200,
                            ),
                          ),
                          const Text(
                            "Collaborators",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            "Coming Soon.",
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: _mediaQuery.width * 1,
                  child: new Column(
                    children: <Widget>[
                      Text(
                        "About Us",
                        style: TextStyle(color: Colors.black,fontSize: 30),
                      ),
                      SizedBox(height: 30,),
                      new Text(
                        "UtubeVyapar platform is dedicated to helping youtubers to get more viewers, with premium and unique features that you can get for free.\n \nStart joining our big network and start getting views in just minutes.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black26,
                            letterSpacing: 0.5,
                            height: 1),
                      ),
                    ],
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
