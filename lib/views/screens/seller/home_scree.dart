// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:lomark/Route/app_routes.dart";
import "package:lomark/controllers/seller/home_screen_controller.dart";
import "package:lomark/helper/product_card.dart";
import "package:lomark/main.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final SellerHomeScreenController sellerHomeScreenController =
      Get.put(SellerHomeScreenController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sellerHomeScreenController.getSelfInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for initialization, you can show a loading indicator
          return CircularProgressIndicator();
        } else {
          // Once initialized, you can access 'me'
          return Scaffold(
              // Your Scaffold content
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (int index) {},
                indicatorColor: Colors.amber,
                // selectedIndex: currentPageIndex,
                destinations: const <Widget>[
                  NavigationDestination(
                    selectedIcon: Icon(Icons.home),
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Badge(child: Icon(Icons.notifications_sharp)),
                    label: 'Notifications',
                  ),
                  NavigationDestination(
                    icon: Badge(
                      label: Text('2'),
                      child: Icon(Icons.messenger_sharp),
                    ),
                    label: 'Messages',
                  ),
                ],
              ),
              appBar: AppBar(
                title: Padding(
                  padding: EdgeInsets.only(left: mq.width * .05),
                  child: Text('Demo'),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: mq.width * .03),
                    child: IconButton(
                      icon: Icon(Icons.person),
                      iconSize: mq.width * .08,
                      onPressed: () {
                        Get.toNamed(AppRoutes.profile);
                      },
                    ),
                  ),
                ],
              ),
              body: ListView(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: mq.width * .06, top: mq.height * .01),
                  child: Text(
                    'Hey! ${sellerHomeScreenController.me.name}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ProductCard(),

                // Product Management Section
              ]));
        }
      },
    );
  }
}


//HomeScreenController.getSelfInfo();
