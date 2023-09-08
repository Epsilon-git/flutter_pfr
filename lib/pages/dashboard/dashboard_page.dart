// ignore_for_file: equal_elements_in_set

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/pages/dashboard/dashboard_controller.dart';
import 'package:pfr/routes/app_routes.dart';
import 'package:pfr/widgets/load_indicator_widget.dart';
import 'package:pfr/widgets/my_container.dart';
import 'package:pfr/widgets/pfr_logo_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (_) {
        if (_.loadState == LoadState.isLoad) return const LoadIndicatorWidget();

        return Scaffold(
          body: ListView(
            padding: MyContainer.getPadding(context, 1200),
            shrinkWrap: true,
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

              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
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
                    subTitle:
                        'Продление выплаты региональной социальной доплаты к пенсии',
                    onTap: () => Get.toNamed(Routes.extension),
                  ),

                  const SizedBox(width: 16),

                  MyCardButton(
                    title: 'Прекращение выплаты',
                    subTitle:
                        'Прекращение выплаты пенсии без юридического лица',
                    onTap: () => Get.toNamed(Routes.termination),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Column(
                children: [
                  ///
                  const Text(
                    'Обращения',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0),
                  ),

                  const SizedBox(height: 16),

                  if (_.applications.isEmpty)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: const Card(
                        child: ListTile(
                          title: Text(
                            'Обращения не найдены',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    )
                  else
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Card(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemCount: _.applications.length,
                          itemBuilder: (context, index) {
                            final application = _.applications[index];
                            final title = _.getPaymentTitleByNumber(
                              application.paymentType!,
                            );

                            final state =
                                _.getStateByNumber(application.state!);

                            return ListTile(
                              leading: Text('${index + 1}. '),
                              title: Text(title),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Дата создания: ${application.dateCreate!}',
                                  ),

                                  ///
                                  if (state != 'Назначена')
                                    Text(
                                      'Дата продления: ${application.dateExtension!}',
                                    ),

                                  ///
                                  Text(
                                    'Статус: $state',
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
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
