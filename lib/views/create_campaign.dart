import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utubevyappar/controller/create_campaign_controller.dart';

class CreateCampaign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateCampaignController createCampaignController =
        Get.put(CreateCampaignController());
    final _mediaQuery = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          /* enter address details */
          /*SizedBox(
            height: 50,
          ),*/
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  width: _mediaQuery.width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Youtube Video Link *",
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
                      // addressController.abortEditing();
                      createCampaignController.abortEditing();
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
          /* complete address */
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onSubmitted: (value) {
                    print(value);
                  },
                  controller: createCampaignController
                      .youtube_video_link_text_controller,
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.label_important,
                      color: Colors.orange,
                    ),
                    hintStyle: TextStyle(fontSize: 16.0, color: Colors.black87),
                    hintText: 'Paste your video link here',
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
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: _mediaQuery.width * 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () => {createCampaignController.submitVideoLink()},
                child: Text(
                  "Submit Video",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.black87),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
