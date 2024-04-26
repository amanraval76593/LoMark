import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:lomark/Route/app_routes.dart";
import "package:lomark/controllers/home_screen_controller.dart";
import "package:lomark/controllers/welcome_screen_cotroller.dart";
import "package:lomark/main.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final BuyerHomeScreenController buyerHomeScreenController =
      Get.put<BuyerHomeScreenController>(BuyerHomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

        // floatingActionButton: FloatingActionButton(onPressed: () async {
//         await buyerHomeScreenController.auth.signOut().then((value) async {
//           await GoogleSignIn().signOut().then((value) {
//             Navigator.pop(context);
//             Get.toNamed(AppRoutes.welcome);
//           });
//         });
//       }),
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: mq.width * .05),
            child: Text('Demo'),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: mq.width * .03),
              icon: Icon(Icons.person),
              iconSize: mq.width * .08,
              onPressed: () {
                // Navigate to profile settings screen
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Dashboard Section
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Orders',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Display key metrics and quick access buttons
                  // Add your widgets here
                ],
              ),
            ),
            // Product Management Section
          ]),
        ));
  }
}
