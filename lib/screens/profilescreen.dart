import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:image_picker/image_picker.dart';

class Profilescreen extends StatefulWidget {
  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox.expand(
          child: Container(
        child: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.red),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
              top: 30.0,
              left: (MediaQuery.of(context).size.width / 2) - 100.0,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      await getImage();
                    },
                    child: CircleAvatar(
                        maxRadius: 100,
                        backgroundImage: _image != null
                            ? FileImage(_image)
                            : AssetImage(
                                "asset/nopic.jpg",
                              )),
                  ),
                  // Column(
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: EdgeInsets.only(top: 60.0),
                  //       child: IconButton(
                  //         icon: Icon(
                  //           Icons.camera,
                  //           size: 30.0,
                  //           color: Colors.amber,
                  //         ),
                  //         onPressed: () async {

                  //         },
                  //       ),
                  //     ),
                  //     IconButton(
                  //       icon: Icon(
                  //         Icons.cloud_upload,
                  //         size: 30.0,
                  //         color: Colors.amber,
                  //       ),
                  //       onPressed: () async {},
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            Positioned(
              top: 250.0,
              left: 25.0,
              right: 25.0,
              child: Column(
                children: <Widget>[
                  Profileinfocard(
                    data: "moahemd eldrerny",
                    hint: "edit your name",
                  ),
                  Profileinfocard(
                    data: "moahemd eldrerny",
                    hint: "edit your name",
                  ),
                  Profileinfocard(
                    data: "moahemd eldrerny",
                    hint: "edit your name",
                  ),
                  Profileinfocard(
                    data: "moahemd eldrerny",
                    hint: "edit your name",
                  ),
                  Profileinfocard(
                    data: "moahemd eldrerny",
                    hint: "edit your name",
                  ),
                  Profileinfocard(
                    data: "moahemd eldrerny",
                    hint: "edit your name",
                  ),
                ],
              ),
            ),
          ]),
        ]),
      )),
    ));
  }
}

class Profileinfocard extends StatelessWidget {
  final String data, hint;

  Profileinfocard({Key key, this.data, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 20,
        child: Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  data,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: accentcolor,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Updatescreen(
                    //               hint: hint,
                    //             )));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
