import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gulf_football/components/customtextfield.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:gulf_football/screens/homescreen.dart';
import 'package:gulf_football/screens/signupscreen.dart';

class Forgetpasswordscreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final mailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: SizeConfig.blockSizeVertical * 45,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(0, 0.75)),
              ],
              color: Color(0xffF2FBF9),
            ),
            child: Column(
              children: [
                Flexible(
                    child: SizedBox(
                  height: SizeConfig.blockSizeVertical * 8,
                )),
                Image.asset(
                  "asset/lock@3x.png",
                  height: SizeConfig.blockSizeVertical * 20,
                ),
                Flexible(
                    child: SizedBox(
                  height: SizeConfig.blockSizeVertical * 3,
                )),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Boldaccectcolor(text: "نسيت كلمة السر ؟"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Contenttext(
                        data: "سوف نرسل لك كلمة السر في بريدك",
                        size: SizeConfig.blockSizeVertical * 2.5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: CustomTextfield(
                        controller: mailcontroller,
                        hint: "اكتب بريدك",
                        isobscure: false,
                        label: "بريدك",
                        priffix: Icons.mail_outline,
                        validator: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: FlatButton(
                          color: accentcolor,
                          onPressed: () async {},
                          child: Text(
                            'ارسل كلمة السر',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "او سجل دخول بواسطة : ",
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          "asset/facebook.png",
                          width: 40,
                          height: 40,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: Image.asset(
                          "asset/Google.png",
                          width: 40,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
