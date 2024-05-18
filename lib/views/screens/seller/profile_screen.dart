// ignore_for_file: prefer_const_constructors

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:phone_input/phone_input_package.dart';
import "package:google_sign_in/google_sign_in.dart";
import "package:lomark/Route/app_routes.dart";
import "package:lomark/controllers/seller/home_screen_controller.dart";
import "package:lomark/controllers/seller/profile_screen_controller.dart";
import 'package:cached_network_image/cached_network_image.dart';
import "package:lomark/main.dart";

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final SellerHomeScreenController sellerHomeScreenController =
      Get.find<SellerHomeScreenController>();
  final SellerProfileScreenController sellerProfileScreenController =
      Get.put(SellerProfileScreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellerProfileScreenController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text("Profile "),
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: FloatingActionButton.extended(
              icon: Icon(Icons.logout),
              backgroundColor: Colors.red.shade400,
              label: Text("LOGOUT"),
              onPressed: () async {
                // Dialogs.ShowProgress(context);
                await sellerHomeScreenController.auth
                    .signOut()
                    .then((value) async {
                  await GoogleSignIn().signOut().then((value) {
                    Navigator.pop(context);
                    //Navigator.pop(context);
                    Get.offNamed(AppRoutes.welcome);
                  });
                });
              },
            ),
          ),
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: mq.height * .03,
                  ),
                  Stack(
                    children: [
                      // _image != null
                      //     ? ClipRRect(
                      //         borderRadius: BorderRadius.circular(mq.height * .1),
                      //         child: Image.file(
                      //           File(_image!),
                      //           fit: BoxFit.cover,
                      //           height: mq.height * .2,
                      //           width: mq.height * .2,
                      //         ),
                      //       )
                      //     :
                      ClipRRect(
                        borderRadius: BorderRadius.circular(mq.height * .1),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: mq.height * .2,
                          width: mq.height * .2,
                          imageUrl: sellerHomeScreenController.me.image,
                          // placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => CircleAvatar(
                            child: Icon(CupertinoIcons.person),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MaterialButton(
                          elevation: 1,
                          color: Colors.white,
                          shape: CircleBorder(),
                          onPressed: () async {
                            // controller.nameEditing.value = true;
                            //_showBottomSheet();
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mq.width * .03,
                  ),
                  Text(sellerHomeScreenController.me.email),
                  SizedBox(
                    height: mq.width * .1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
                    child: TextFormField(
                      readOnly: !controller.nameEditing.value,
                      autofocus: !controller.nameEditing.value,
                      onSaved: (val) {},
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : "Required field",
                      initialValue: sellerHomeScreenController.me.name,
                      decoration: InputDecoration(
                        label: Text("Name"),
                        hintText: "eg-Aman Raval",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.showBottomSheet(context);
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mq.width * .1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
                    child: TextFormField(
                      readOnly: !controller.phoneEditing.value,
                      autofocus: !controller.phoneEditing.value,
                      onSaved: (val) {},
                      validator: (value) => value != null && value.isNotEmpty
                          ? null
                          : "Required field",
                      initialValue: sellerHomeScreenController.me.phone,
                      decoration: InputDecoration(
                        label: Text("Phone"),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.phoneEditing.value = true;
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
