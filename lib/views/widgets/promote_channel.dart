import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_information.dart';

class PromoteChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.bottomSheet(UserInformation(),
            isScrollControlled: true, backgroundColor: Colors.white);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        height: _mediaQuery.height * 0.25,
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
    );
  }
}
