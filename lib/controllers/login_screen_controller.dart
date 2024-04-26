// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lomark/controllers/welcome_screen_cotroller.dart';
import 'package:lomark/model/user.dart';
import 'package:phone_input/phone_input_package.dart';

class LoginScreenController extends GetxController {
  WelcomeScreenController welcomeScreenController =
      Get.find<WelcomeScreenController>();
  //static User get user => auth.currentUser!;
  late String name;
  late Type role;
  late PhoneNumber phone;
  TextEditingController namecontroller = TextEditingController();

  // PhoneController phoneController =
  //     PhoneController(welcomeScreencontroller.auth.currentUser?.phoneNumber as PhoneNumber?);
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<bool> userExist() async {
    return (await firestore
            .collection('users')
            .doc(welcomeScreenController.auth.currentUser!.uid)
            .get())
        .exists;
  }

  Future<void> createUser(String name, PhoneNumber phone, Type role) async {
    final newUser = AppUser(
      image: welcomeScreenController.auth.currentUser!.photoURL.toString(),
      name: name,
      id: welcomeScreenController.auth.currentUser!.uid,
      email: welcomeScreenController.auth.currentUser!.email.toString(),
      phone: phone.nsn,
      role: role,
    );

    return (await firestore
        .collection('users')
        .doc(welcomeScreenController.auth.currentUser!.uid)
        .set(newUser.toJson()));
  }
}
