import 'package:get/get.dart';
import 'package:lomark/Route/app_routes.dart';
import 'package:lomark/views/screens/home_scree.dart';
import 'package:lomark/views/screens/login_screen.dart';
import 'package:lomark/views/screens/welcome_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    )
  ];
}
