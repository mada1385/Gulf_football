// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulf_football/components/customtextfield.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gulf_football/models/user.dart';
import 'package:gulf_football/screens/forgetpasswordscreen.dart';
import 'package:gulf_football/screens/homescreen.dart';
import 'package:gulf_football/screens/signupscreen.dart';
import 'package:gulf_football/services/authAPI.dart';

class Signinscreen extends StatefulWidget {
  @override
  _SigninscreenState createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final mailcontroller = TextEditingController(),
      passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isobsecurepass = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 20,
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
                    Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Boldaccectcolor(text: "لنكمل ما بدأناه"),
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
                            data: "سجل حسابك للمتابعة",
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: CustomTextfield(
                          controller: mailcontroller,
                          hint: "اكتب بريدك",
                          isobscure: false,
                          label: "بريدك",
                          priffix: Icons.mail_outline,
                          validator: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: CustomTextfield(
                        suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              isobsecurepass = !isobsecurepass;
                            });
                          },
                          child: Icon(
                            Icons.remove_red_eye,
                            color: accentcolor,
                            size: 20,
                          ),
                        ),
                        controller: passwordcontroller,
                        hint: "اكتب كلمة السر",
                        isobscure: isobsecurepass,
                        label: "كلمة السر",
                        priffix: Icons.lock_outline,
                        validator: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Contenttext(data: "نسيت كلمة السر ؟  ", size: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Forgetpasswordscreen()));
                              },
                              child: Text(
                                "اضغط هنا",
                                style: TextStyle(
                                    color: accentcolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: FlatButton(
                            color: accentcolor,
                            onPressed: () async {
                              // Validate returns true if the form is valid, or false
                              // otherwise.
                              if (_formKey.currentState.validate()) {
                                print(mailcontroller.toString());

                                User user = User(
                                  mailcontroller.text,
                                  passwordcontroller.text,
                                );
                                Authapi x = Authapi();
                                var signup = await x.login(user);
                                print(signup["msg"]);
                                if (signup["success"]) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homescreen()));
                                } else {
                                  print(signup["msg"]);
                                }
                              }
                            },
                            child: Text(
                              'تسجيل دخول',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Contenttext(data: "لا تملك حساب ؟  ", size: 15),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signupscreen()));
                            },
                            child: Text(
                              "انشأ حساب",
                              style: TextStyle(
                                  color: accentcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
