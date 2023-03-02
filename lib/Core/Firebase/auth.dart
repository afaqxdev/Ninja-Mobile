import 'package:Ninja/Feature/BottomNAv/bottomNav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Dialogue/dialog.dart';
import '../LocalDB/localdb.dart';
import '../Routes/routesName.dart';

FirebaseAuth auth = FirebaseAuth.instance;
var DB = FirebaseFirestore.instance;
localdatabase ldb = localdatabase();

class Authcontroler extends ChangeNotifier {
  String _photoUrl = '';
  String _name = '';
  String _email = '';
  get photourl => _photoUrl;
  get name => _name;
  get email => _email;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _Goooglecheck = false;
  bool get Googlecheck => _Goooglecheck;

  void signInWithGoogle() async {
    CommonDialog.showDialog();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      await DB
          .collection('App_User_credentials')
          .doc(userCredential.user!.uid)
          .set({
        'user_Id': userCredential.user!.uid,
        'firstname': userCredential.user!.displayName,
        'password': "*********",
        'email': userCredential.user!.email,
        'image': userCredential.user!.photoURL,
      }).then((value) {
        ldb.setuserData(
          userid: userCredential.user!.uid.toString(),
          email: userCredential.user!.email,
        );
        _name = userCredential.user!.displayName.toString();
        _photoUrl = userCredential.user!.photoURL.toString();
        _email = userCredential.user!.email.toString();

        notifyListeners();
        CommonDialog.hideLoading();
        Get.to(BottomNav());
      });
    } catch (e) {
      CommonDialog.hideLoading;
      print(e);
      CommonDialog.showErrorDialog(
        description: '$e',
      );
    }
  }

  void check(bool vlaue) {
    _Goooglecheck = vlaue;
    notifyListeners();
  }

  void handleGoogleSignOut(BuildContext context) async {
    try {
      CommonDialog.showDialog();
      _googleSignIn.disconnect().then((value) {
        _googleSignIn.signOut().then((value) {
          _auth.signOut();
        }).then((value) {
          Navigator.popAndPushNamed(context, RoutesName.SingIN);
        });
      }).onError((error, stackTrace) {
        CommonDialog.hideLoading();
        CommonDialog.showErrorDialog(description: "$error");
      });
    } on Exception catch (e) {
      CommonDialog.hideLoading();
      return CommonDialog.showErrorDialog(description: "$e");
    }
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
        }).then((value) {
          ldb.setuserData(
              userid: userCredential.user!.uid.toString(), email: email);

          Get.offAll(SignIn());
        });
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
