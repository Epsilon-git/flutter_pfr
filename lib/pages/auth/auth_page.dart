import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfr/pages/auth/auth_controller.dart';
import 'package:pfr/widgets/my_elevated_button.dart';
import 'package:pfr/widgets/my_text_field.dart';
import 'package:pfr/widgets/pfr_logo_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = (MediaQuery.of(context).size.width - 600) / 2;

    const cardBorderRadius = 30.0;

    return GetBuilder<AuthController>(
      init: AuthController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: (padding <= 0) ? 16 : padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cardBorderRadius),
                  ),
                  color: Colors.grey.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        /// Лого
                        const PFRLogoWidget(),

                        const SizedBox(height: 16),

                        const Divider(),

                        const SizedBox(height: 16),

                        const SizedBox(height: 16),

                        /// Логин
                        MyTextFieldWithBorder(
                          controller: _.emailController,
                          hintText: 'СНИЛС',
                          prefixIcon: Icons.person,
                        ),

                        const SizedBox(height: 16),

                        /// Пароль
                        MyTextFieldWithBorder(
                          controller: _.passController,
                          hintText: 'Пароль',
                          prefixIcon: Icons.lock,
                        ),

                        const SizedBox(height: 16),

                        const SizedBox(height: 16),

                        /// Кнопка "Войти"
                        MyElevatedButton(
                          title: 'Войти',
                          onPressed: () => _.signIn(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
