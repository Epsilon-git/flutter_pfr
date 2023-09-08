import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pfr/data/session_data_provider.dart';
import 'package:pfr/routes/app_routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: '${emailController.text.trim()}@mail.ru',
      password: passController.text.trim(),
    );

    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return;
    } else {
      SessionDataProvider().setSessionId(value: user.uid);
      Get.toNamed(Routes.dashboard);
    }
  }

  readDataId() async {}

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }
}
