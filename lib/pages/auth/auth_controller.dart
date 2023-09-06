import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:pfr/routes/app_routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: '${emailController.text.trim()}@mail.ru',
      password: passController.text.trim(),
    );

    if (kDebugMode) {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        print('Ошибка входа в аккаунт');
        return;
      } else {
        print('Пользователь вошел в систему!');
        Get.toNamed(Routes.dashboard);
      }
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
