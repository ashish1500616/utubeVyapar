import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            /* enter address details */
            /*SizedBox(
              height: 50,
            ),*/
            Row(
              children: [
                Container(
                  width: _mediaQuery.width * 0.9,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      (addressController.editingText.isFalse)
                          ? "Enter address details"
                          : "Edit address details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _mediaQuery.width * 0.1,
                  child: IconButton(
                    onPressed: () {
                      addressController.abortEditing();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            /* your location section */
            (addressController.editingText == false)
                ? Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: _mediaQuery.width * 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "YOUR LOCATION",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      /* GPS Address , Make it in a seperate row.*/
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          Obx(
                                () => SizedBox(
                              width: _mediaQuery.width * 0.8,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  mapController.pickedAddress.value,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
                : Container(),
            SizedBox(
              height: 10,
            ),
            /* complete address */
            Column(
              children: [
                Container(
                  width: _mediaQuery.width * 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Complete Address *",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onSubmitted: (value) {
                      print(value);
                    },
                    controller: addressController.house_flat_controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.label_important,
                        color: Colors.orange,
                      ),
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                      hintText: 'House no./Flat no./Floor/Building',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: _mediaQuery.width * 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Floor Address (Optional)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  /* 2nd text input field. */
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: addressController.floor_controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.label_important,
                          color: Colors.greenAccent),
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: _mediaQuery.width * 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Landmark *",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: addressController.landmark_controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.label_important,
                        color: Colors.orange,
                      ),
                      /*hintText: 'Landmark',*/
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: _mediaQuery.width * 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Save this location as *",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: addressController.title_controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.label_important,
                        color: Colors.orange,
                      ),
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
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
                  onPressed: () => {
                    print(addressController.editingText.value),
                    if (addressController.editingText.isTrue)
                      {addressController.saveEditedAddress()}
                    else
                      {addressController.validate_and_add()}
                  },
                  child: Text(
                    "Save Address",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.yellowAccent),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
