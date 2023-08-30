import 'package:get/get.dart';
import 'package:pfr/pages/auth/auth_page.dart';
import 'package:pfr/pages/dashboard/dashboard_page.dart';
import 'package:pfr/pages/extension/extension_page.dart';
import 'package:pfr/pages/purpose/purpose_page.dart';
import 'package:pfr/pages/termination/termination_page.dart';
import 'package:pfr/routes/app_routes.dart';

class AppPages {
  AppPages._();

  /// Домашний экран
  static const initialRoute = Routes.auth;

  static final routes = [
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
    ),
    GetPage(
      name: Routes.termination,
      page: () => const TerminationPage(),
    ),
    GetPage(
      name: Routes.extension,
      page: () => const ExtensionPage(),
    ),
    GetPage(
      name: Routes.purpose,
      page: () => const PurposePage(),
    ),
  ];
}
