import 'package:get/get.dart';
import 'package:pfr/pages/auth/auth_controller.dart';
import 'package:pfr/pages/auth/auth_page.dart';
import 'package:pfr/pages/check_auth/check_auth_controller.dart';
import 'package:pfr/pages/check_auth/check_auth_page.dart';
import 'package:pfr/pages/dashboard/dashboard_controller.dart';
import 'package:pfr/pages/dashboard/dashboard_page.dart';
import 'package:pfr/pages/extension/extension_controller.dart';
import 'package:pfr/pages/extension/extension_page.dart';
import 'package:pfr/pages/purpose/purpose_controller.dart';
import 'package:pfr/pages/purpose/purpose_page.dart';
import 'package:pfr/pages/termination/termination_controller.dart';
import 'package:pfr/pages/termination/termination_page.dart';
import 'package:pfr/routes/app_routes.dart';

class AppPages {
  AppPages._();

  /// Домашний экран
  static const initialRoute = Routes.checkAuth;

  static final routes = [
    GetPage(
      name: Routes.checkAuth,
      page: () => const CheckAuthPage(),
      binding: BindingsBuilder(() {
        Get.put(CheckAuthController());
      }),
    ),
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: BindingsBuilder(() {
        Get.put(AuthController());
      }),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.termination,
      page: () => const TerminationPage(),
      binding: BindingsBuilder(() {
        Get.put(TerminationController());
      }),
    ),
    GetPage(
      name: Routes.extension,
      page: () => const ExtensionPage(),
      binding: BindingsBuilder(() {
        Get.put(ExtensionController());
      }),
    ),
    GetPage(
      name: Routes.purpose,
      page: () => const PurposePage(),
      binding: BindingsBuilder(() {
        Get.put(PurposeController());
      }),
    ),
  ];
}
