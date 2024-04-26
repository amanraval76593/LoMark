// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lomark/Route/app_routes.dart";
import "package:lomark/controllers/welcome_screen_cotroller.dart";
import "package:lomark/main.dart";

class WelcomeScreen extends StatelessWidget {
  final WelcomeScreenController welcomeScreenController =
      Get.put<WelcomeScreenController>(WelcomeScreenController());
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   'Welcome to ',
            //   style: TextStyle(
            //       fontSize: mq.height * .05, fontWeight: FontWeight.w500),
            // ),
            Text(
              'Demo',
              style: TextStyle(
                  fontSize: mq.height * .05,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
            ),
            SizedBox(
              height: mq.height * .20,
            ),
            Stack(children: [
              Positioned(
                // bottom: mq.height * .15,
                // width: mq.width * .9,
                // left: mq.width * .05,
                // height: mq.height * .07,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade500,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () async {
                    await welcomeScreenController.handlegooglesignin();
                  },
                  icon: Image.asset(
                    "images/google.png",
                    height: mq.height * .03,
                  ),
                  label: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mq.width * .01, vertical: mq.height * .02),
                    child: RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          children: [
                            TextSpan(text: ' Sign in with '),
                            TextSpan(
                                text: 'Google',
                                style: TextStyle(fontWeight: FontWeight.w500))
                          ]),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
