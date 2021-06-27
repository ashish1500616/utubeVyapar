import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:utubevyappar/controller/create_campaign_controller.dart';
import 'package:utubevyappar/controller/home_page_controller.dart';

class CreateCampaign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreateCampaignController createCampaignController =
        Get.put(CreateCampaignController());
    HomePageController homePageController = Get.find();
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
                      "Youtube Link *",
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
                    hintStyle:
                        const TextStyle(fontSize: 16.0, color: Colors.black87),
                    hintText: 'Paste your link here',
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
              Container(
                padding: EdgeInsets.all(10),
                child: FormBuilder(
                  key: createCampaignController.formKey,
                  child: FormBuilderChoiceChip(
                    name: 'choice_chip',
                    decoration: InputDecoration(
                      labelText: 'Select a category',
                    ),
                    options: [
                      FormBuilderFieldOption(
                          value: '1',
                          child: const Text(
                            'Unboxing',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          )),
                      FormBuilderFieldOption(
                          value: '2',
                          child: const Text(
                            'Educational',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          )),
                      FormBuilderFieldOption(
                          value: '3',
                          child: const Text(
                            'Favorites/Best Of',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          )),
                      FormBuilderFieldOption(
                          value: '4',
                          child: const Text(
                            'Tag or Challenge',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          )),
                      FormBuilderFieldOption(
                        value: '5',
                        child: const Text(
                          'Haul',
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      FormBuilderFieldOption(
                        value: '6',
                        child: const Text(
                          'Comedy/Skit',
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      FormBuilderFieldOption(
                          value: '7',
                          child: const Text(
                            'Vlogs',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          )),
                      FormBuilderFieldOption(
                          value: '8',
                          child: const Text(
                            'How-To',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          )),
                      FormBuilderFieldOption(
                          value: '9',
                          child: const Text(
                            'Product Review',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          )),
                      FormBuilderFieldOption(
                          value: '10',
                          child: const Text(
                            'Gaming',
                            style: TextStyle(
                              letterSpacing: 1,
                            ),
                          ))
                    ],
                    validator: FormBuilderValidators.required(context,
                        errorText: "Please select one of the category"),
                  ),
                  onChanged: () {
                    print("Changed ");
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            child: AdWidget(ad: createCampaignController.bannerAdFourth),
            width: createCampaignController.bannerAdFourth.size.width.toDouble(),
            height: createCampaignController.bannerAdFourth.size.height.toDouble(),
          ),
          SizedBox(height: 20),
          Container(
            width: _mediaQuery.width * 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () => {createCampaignController.submitVideoLink()},
                child: const Text(
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
