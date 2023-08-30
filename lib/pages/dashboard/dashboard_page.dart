import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfr/pages/dashboard/dashboard_controller.dart';
import 'package:pfr/routes/app_routes.dart';
import 'package:pfr/widgets/pfr_logo_widget.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = (MediaQuery.of(context).size.width - 1200) / 2;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: (padding <= 0) ? 16 : padding),
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                /// Лого
                const PFRLogoWidget(),

                const SizedBox(height: 16),

                const Divider(),

                const SizedBox(height: 16),

                const Text(
                  'Причина обращения',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///

                    MyCardButton(
                      title: 'Назначение выплаты',
                      subTitle: 'Установление ежемесячной денежной выплаты',
                      onTap: () => Get.toNamed(Routes.purpose),
                    ),

                    const SizedBox(width: 16),

                    MyCardButton(
                      title: 'Продление выплаты',
                      subTitle: 'Продление выплаты региональной социальной доплаты к пенсии',
                      onTap: () => Get.toNamed(Routes.extension),
                    ),

                    const SizedBox(width: 16),

                    MyCardButton(
                      title: 'Прекращение выплаты',
                      subTitle: 'Прекращение выплаты пенсии без юридического лица',
                      onTap: () => Get.toNamed(Routes.termination),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyCardButton extends StatelessWidget {
  const MyCardButton({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  subTitle,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
