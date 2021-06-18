import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentUserName = FirebaseAuth.instance.currentUser!.displayName;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(25, 25, 15, 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'WELCOME , $currentUserName',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
          )),
    );
  }
}
