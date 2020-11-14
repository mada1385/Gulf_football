import 'package:flutter/material.dart';
import 'package:gulf_football/components/customtextfield.dart';
import 'package:gulf_football/components/texts.dart';
import 'package:gulf_football/config/colors.dart';
import 'package:gulf_football/config/mediaqueryconfig.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gulf_football/models/user.dart';
import 'package:gulf_football/screens/countrylistscreen.dart';
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
                              labelStyle: TextStyle(color: textcolor),
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.green,
                              ),
                              prefixText: ' ',
                              // suffix: ,
                              suffixStyle:
                                  const TextStyle(color: Colors.green)),
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
                                User user = User(mailcontroller.text,
                                    passwordcontroller.text,
                                    username: usernamecontroller.text);
                                Authapi x = Authapi();
                                var signup = await x.register(user);

                                if (signup["success"]) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Countrylistscreen()));
                                } else {
                                  print(signup["msg"]);
                                }
                              }
                            },
                            child: Text(
                              'تسجيل حساب',
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
                          "او انشأ حساب بواسطة",
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
    );
  }
}
