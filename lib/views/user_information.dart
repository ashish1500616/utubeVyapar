import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/controller/user_information_controller.dart';

class UserInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserInformationController userInformationController = Get.find();
    final _mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: _mediaQuery.width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "User Information *",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _mediaQuery.width * 0.2,
                  child: IconButton(
                    onPressed: () {
                      userInformationController.abortEditing();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
              child: const Text(
                "Please provide us channel link so that we can ask our viewers to like and subscribe on your behalf.",
                style: TextStyle(
                    color: Colors.black87, fontSize: 10, letterSpacing: 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onSubmitted: (value) {
                print(value);
              },
              controller: userInformationController.youtube_channel_link,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.label_important,
                  color: Colors.orange,
                ),
                hintStyle: const TextStyle(fontSize: 16.0, color: Colors.black87),
                hintText: 'Paste your channel link here',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
              child: const Text(
                "Thanks for using UtubeVyapar..\n",
                style: TextStyle(
                    color: Colors.black87, fontSize: 10, letterSpacing: 1),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: _mediaQuery.width * 8,
            child: Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () =>
                    {userInformationController.addYoutubeChannelToUser()},
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange.shade200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
