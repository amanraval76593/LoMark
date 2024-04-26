import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lomark/Route/app_routes.dart';

class WelcomeScreenController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User get user => auth.currentUser!;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> userExist() async {
    return (await firestore.collection('users').doc(user.uid).get()).exists;
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await auth.signInWithCredential(credential);
    } catch (e) {
      print("error in sign in : $e");
      //Dialogs.showWarning(context, "Check your Internet Connection!");
      return null;
    }
  }

  handlegooglesignin() {
    //Dialogs.ShowProgress(context);
    signInWithGoogle().then((user) async {
      //Get.back();
      if (user != null) {
        print(user.user);
        print(user.additionalUserInfo);
        if (await userExist()) {
          print("yes");
          Get.offNamed(AppRoutes.home);
        } else {
          Get.offNamed(AppRoutes.login);
          print("no");
          // await createUser().then((value) {});
        }
      }
    });
  }
}
