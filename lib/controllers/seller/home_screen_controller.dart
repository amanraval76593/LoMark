import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:firebase_auth/firebase_auth.dart';
import "package:lomark/model/user.dart";

class SellerHomeScreenController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late AppUser me;

  Future<void> getSelfInfo() async {
    await firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((user) {
      me = AppUser.fromJson(user.data()!);
      // getPushToken();
    });
  }
}
