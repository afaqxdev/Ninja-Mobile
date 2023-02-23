import 'package:Ninja/Feature/BottomNAv/bottomNav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Dialogue/dialog.dart';
import '../LocalDB/localdb.dart';

FirebaseAuth auth = FirebaseAuth.instance;
var DB = FirebaseFirestore.instance;
localdatabase ldb = localdatabase();

class Authcontroler extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _Goooglecheck = false;
  bool get Googlecheck => _Goooglecheck;

  Future<UserCredential?> signInWithGoogle() async {
    CommonDialog.showDialog();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      ldb.setuserData(
          email: googleAuth.accessToken, userid: googleAuth.idToken);
      _Goooglecheck = true;
      notifyListeners();
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
    CommonDialog.hideLoading();
    Get.to(BottomNav());
    return null;
  }

  Future<void> signup({name, email, password, images}) async {
    try {
      CommonDialog.showDialog();

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      CommonDialog.hideLoading();
      try {
        CommonDialog.showDialog();
        await DB
            .collection('App_User_credentials')
            .doc(userCredential.user!.uid)
            .set({
          'user_Id': userCredential.user!.uid,
          'firstname': name,
          'password': password,
          'email': email,
          'image': images,
        });
        ldb.setuserData(
            userid: userCredential.user!.uid.toString(), email: email);
        _Goooglecheck = false;
        notifyListeners();
        Get.offAll(SignIn());
      } catch (e) {
        print("inside the catch");
        CommonDialog.hideLoading();
        CommonDialog.showErrorDialog(
            description: "Error Saving data at FireStore $e");
      }
    } on FirebaseAuthException catch (value) {
      CommonDialog.hideLoading();
      if (value.code == 'weak-password') {
        CommonDialog.showErrorDialog(
            description: "The password provided is too weak.");
        print('The password provided is too weak.');
      } else if (value.code == 'email-already-in-use') {
        CommonDialog.showErrorDialog(
            description: "The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: "Something went wrong");
    }
  }

  Future<void> SignIn({String? email, password}) async {
    try {
      CommonDialog.showDialog();

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email!.trim(), password: password!);
      ldb.setuserData(
          userid: userCredential.user!.uid.toString(), email: email);
      _Goooglecheck = false;

      Get.offAll(BottomNav());
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommonDialog.showErrorDialog(
            description: "User not found for that email");
      } else if (e.code == 'wrong-password') {
        CommonDialog.showErrorDialog(
            description: "password is worng try again");
      }
    }
  }

  Future<void> passwordRest({String? remail}) async {
    try {
      CommonDialog.showDialog();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: remail!.trim());
      CommonDialog.hideLoading();
      Get.defaultDialog(
        title: "Password Reset Email Sent",
        middleText:
            "Check your email for instructions on how to reset your password.",
        onCancel: () {
          Get.off(SignIn());
        },
      );
    } on FirebaseAuthException catch (e) {
      CommonDialog.showErrorDialog(description: "$e");
    }
    CommonDialog.hideLoading();
  }

  Future<void> getdata(String name, String image) async {
    final firestore = FirebaseAuth.instance.currentUser;
    final user = await FirebaseFirestore.instance
        .collection("App_User_credentials")
        .doc(firestore!.uid)
        .get();
    print("this is the result $name");
    image = user.data()!["image"];
    name = user.data()!["firstname"];
    notifyListeners();
  }

  Future<void> Update(
    String DataName,
    dynamic controller,
  ) async {
    Get.back();
  }
}
