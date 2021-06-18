import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/intro_page.png",
                    ),
                    fit: BoxFit.contain),
              ),
              height: MediaQuery.of(context).size.height * .45,
            ),
            Text(
              "Watch Videos\n To Grow Your Views",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  fontSize: 22,
                  letterSpacing: 1.3),
            ),
            Text(
              "UTubeVyapar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 1.8,
                  fontSize: 22,
                  letterSpacing: 1.3),
            ),
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {
                /*new SignIn().signInWithGoogle().then((result) {
                  if (result != null) {
                    Get.to(HomePage());
                  }
                });*/
                Get.toNamed("/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
