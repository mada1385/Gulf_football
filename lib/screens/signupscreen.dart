import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gulf_football/components/customtextfield.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gulf_football/models/user.dart';
import 'package:gulf_football/screens/countrylistscreen.dart';
import 'package:gulf_football/screens/nointernetscreen.dart';
import 'package:gulf_football/screens/signinscreen.dart';
import 'package:gulf_football/services/authAPI.dart';

class Signupscreen extends StatefulWidget {
  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final mailcontroller = TextEditingController(),
      usernamecontroller = TextEditingController(),
      confirmpasswordcontroller = TextEditingController(),
      passwordcontroller = TextEditingController();
  bool isobsecurepass = true, isobsecureCpass = true;

  final _formKey = GlobalKey<FormState>();
  String password;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Scaffold(
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
                            Boldaccectcolor(text: "لنبدأ"),
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
                              data: "سجل حساب للمتابعة",
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
                            hint: "اكنب بريدك",
                            isobscure: false,
                            label: "بريدك",
                            priffix: Icons.mail_outline,
                            validator: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: CustomTextfield(
                            controller: usernamecontroller,
                            hint: "اكتب اسم المستخدم",
                            isobscure: false,
                            label: "اسم المستخدم",
                            priffix: Icons.person_outline,
                            validator: 0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: TextFormField(
                            onChanged: (val) => password = val,
                            controller: confirmpasswordcontroller,
                            obscureText: isobsecureCpass,
                            decoration: new InputDecoration(
                                suffix: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isobsecureCpass = !isobsecureCpass;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: accentcolor,
                                    size: 20,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: accentcolor)),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: accentcolor)),
                                hintText: "اعد كتابة كلمة السر",
                                labelText: "تأكيد كلمة السر",
                                labelStyle: TextStyle(
                                  color: textcolor,
                                  fontFamily: 'cairo',
                                ),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: accentcolor,
                                ),
                                prefixText: ' ',
                                // suffix: ,
                                suffixStyle:
                                    const TextStyle(color: accentcolor)),
                            validator: (val) => MatchValidator(
                                    errorText: 'passwords do not match')
                                .validateMatch(confirmpasswordcontroller.text,
                                    passwordcontroller.text),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: accentcolor,
                              ),
                              Container(
                                width: 20,
                              ),
                              Text(
                                  "بتسجيل حساب انت توافق على على الشروط والاحكام"),
                            ],
                          ),
                          width: double.infinity,
                        ),
                      ),
                      Signupsnackbutton(
                          formKey: _formKey,
                          mailcontroller: mailcontroller,
                          passwordcontroller: passwordcontroller,
                          usernamecontroller: usernamecontroller),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Contenttext(data: "لديك حساب بالفعل ؟  ", size: 15),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signinscreen()));
                              },
                              child: Text(
                                "سجل دخول",
                                style: TextStyle(
                                    fontFamily: 'cairo',
                                    color: accentcolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       "او انشأ حساب بواسطة",
                      //       style: TextStyle(
                      //           color: textcolor,
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     GestureDetector(
                      //       child: Image.asset(
                      //         "asset/facebook.png",
                      //         width: 40,
                      //         height: 40,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () async {
                      //         final user = await Authapi().handleSignIn(context);
                      //         if (user.uid != null) {
                      //           Navigator.pushReplacement(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) =>
                      //                       Countrylistscreen()));
                      //         }
                      //       },
                      //       child: Image.asset(
                      //         "asset/Google.png",
                      //         width: 40,
                      //         height: 40,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Signupsnackbutton extends StatelessWidget {
  const Signupsnackbutton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.mailcontroller,
    @required this.passwordcontroller,
    @required this.usernamecontroller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController mailcontroller;
  final TextEditingController passwordcontroller;
  final TextEditingController usernamecontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Users user = Users(mailcontroller.text, passwordcontroller.text,
                    username: usernamecontroller.text);
                Authapi x = Authapi();
                var signup = await x.register(user, context);

                if (signup["success"]) {
                  HapticFeedback.mediumImpact();

                  Scaffold.of(context).showSnackBar(SnackBar(
                      elevation: 10,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: accentcolor,
                      content: Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          signup["msg"],
                          style: TextStyle(
                              fontFamily: 'cairo',
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ))));
                  Future.delayed(Duration(seconds: 2), () {
                    // 5s over, navigate to a new page
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Countrylistscreen()));
                  });
                } else {
                  HapticFeedback.mediumImpact();
                  Future.delayed(Duration(milliseconds: 30), () {
                    // 5s over, navigate to a new page
                    HapticFeedback.mediumImpact();
                  });

                  Scaffold.of(context).showSnackBar(SnackBar(
                      elevation: 10,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: accentcolor,
                      content: Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          signup["msg"],
                          style: TextStyle(
                              fontFamily: 'cairo',
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ))));
                }
              } else {
                HapticFeedback.mediumImpact();
                Future.delayed(Duration(milliseconds: 30), () {
                  // 5s over, navigate to a new page
                  HapticFeedback.mediumImpact();
                });
              }
            },
            child: Text(
              'تسجيل حساب',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'cairo',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
