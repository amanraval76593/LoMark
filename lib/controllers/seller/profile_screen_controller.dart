import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lomark/controllers/seller/home_screen_controller.dart";
import "package:lomark/main.dart";
import "package:modal_bottom_sheet/modal_bottom_sheet.dart";

class SellerProfileScreenController extends GetxController {
  String? image;
  RxBool nameEditing = false.obs;
  RxBool phoneEditing = false.obs;
  SellerHomeScreenController sellerHomeScreenController=Get.find<SellerHomeScreenController>();

   Future<void> updateName() async {
    await sellerHomeScreenController.firestore
        .collection('users')
        .doc(sellerHomeScreenController.auth.currentUser!.uid)
        .update({'name': sellerHomeScreenController.me.name});
  }
  void showBottomSheet(var context) {
    FocusNode focusNode = FocusNode();
    showMaterialModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: ListView(
          padding: EdgeInsets.only(
              bottom: focusNode.hasFocus ? mq.height * .35 : mq.height * .01),
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: mq.height * .0017,
              ),
              child: Center(
                child: Text(
                  "Change Name",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .07, vertical: mq.width * .025),
              child: TextFormField(
                focusNode: focusNode,
                autofocus: true,
                // initialValue: newMessage,
                style: TextStyle(fontSize: 18),
                onChanged: (value) {
                  //  newMessage = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mq.width * .02, vertical: mq.width * .02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: mq.height * .02),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Apis().updateMessage(widget.message, newMessage);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: mq.height * .02),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
