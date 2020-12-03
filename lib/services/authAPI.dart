import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gulf_football/config/provider.dart';
import 'package:gulf_football/models/user.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Authapi {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future postimage(File image, String token) async {
    try {
      final favouriteteam = await post(
          "https://gulf-goal.herokuapp.com/api/users/update-image",
          headers: {
            // 'Content-Type': 'application/json',
            // 'Accept': 'application/json',
            "Authorization": "bearer $token",
          },
          body: {
            "image": image,
          });
      var body;
      print("Api service: ${favouriteteam.body}");
      body = jsonDecode(favouriteteam.body);
      if (body["success"]) {
        print("success");
        return body;
      } else {
        print("success");
        return body;
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future register(Users x, BuildContext context) async {
    try {
      final signup =
          await post("http://gulf-goal.herokuapp.com/api/users/signup", body: {
        "password": x.password,
        "email": x.email,
        "username": x.username
      });
      var body = jsonDecode(signup.body);
      print(body);
      if (body["success"]) {
        print("Sucsess");
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", body["token"]);

        preferences.setString("username", x.username);

        Provider.of<Userprovider>(context, listen: false)
            .settoken(body["token"]);
        Provider.of<Userprovider>(context, listen: false)
            .setusername(body["username"]);
        print(Provider.of<Userprovider>(context, listen: false).token);
        return jsonDecode(signup.body);
      } else
        print("failed");
      return jsonDecode(signup.body);
    } catch (e) {
      print(e);
      return e;
    }
  }

  // void signOutGoogle() async {
  //   await _googleSignIn.signOut();
  //   print("User Sign Out");
  // }

  // Future<FirebaseUser> handleSignIn(BuildContext context) async {
  //   // hold the instance of the authenticated user
  //   FirebaseUser user;
  //   // flag to check whether we're signed in already
  //   bool isSignedIn = await _googleSignIn.isSignedIn();
  //   try {
  //     if (isSignedIn) {
  //       // if so, return the current user
  //       user = await _auth.currentUser();
  //       final token = await user.getIdToken();
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       preferences.setString("token", token.token);
  //       Provider.of<Userprovider>(context, listen: false).settoken(null);
  //     } else {
  //       final GoogleSignInAccount googleUser =
  //           await _googleSignIn.signIn().catchError((onError) {
  //         print("error $onError");
  //       });
  //       final GoogleSignInAuthentication googleAuth =
  //           await googleUser.authentication;
  //       // get the credentials to (access / id token)
  //       // to sign in via Firebase Authentication
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       preferences.setString("token", googleAuth.idToken);
  //       final AuthCredential credential = GoogleAuthProvider.getCredential(
  //           accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //       user = (await _auth.signInWithCredential(credential)).user;
  //     }

  //     return user;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future login(Users x, BuildContext context) async {
    try {
      final signup =
          await post("http://gulf-goal.herokuapp.com/api/users/login", body: {
        "password": x.password,
        "email": x.email,
      });
      var body = jsonDecode(signup.body);
      print(body);
      if (body["success"]) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", body["token"]);
        preferences.setString("username", body["username"]);

        Provider.of<Userprovider>(context, listen: false)
            .settoken(body["token"]);
        Provider.of<Userprovider>(context, listen: false)
            .setusername(body["username"]);
        print(Provider.of<Userprovider>(context, listen: false).token);
        return body;
      } else {
        return body;
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future logout(BuildContext context) async {
    // bool isSignedIn = await _googleSignIn.isSignedIn();
    // // if (isSignedIn) {
    // //   signOutGoogle();
    // // }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", null);
    preferences.setString("username", null);
    print(preferences.get("token"));
    Provider.of<Userprovider>(context, listen: false).settoken(null);
  }
}
