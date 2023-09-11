import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/pages/termination/termination_controller.dart';
import 'package:pfr/routes/app_routes.dart';
import 'package:pfr/widgets/load_indicator_widget.dart';
import 'package:pfr/widgets/my_container.dart';
import 'package:pfr/widgets/my_elevated_button.dart';
import 'package:pfr/widgets/my_text_field.dart';

/// Прекращение выплаты
class TerminationPage extends StatelessWidget {
  const TerminationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TerminationController>(
      init: TerminationController(),
      builder: (_) {
        if (_.loadState == LoadState.isLoad) return const LoadIndicatorWidget();

        return Scaffold(
          body: (_.applications.isEmpty)
              ? const MyContainer(
                  child: Center(
                    child: Text(
                      'Выплаты отсутствуют',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: MyContainer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          color: Colors.grey.shade50,
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () =>
                                        Get.offAllNamed(Routes.dashboard),
                                    child: const Icon(
                                      Icons.arrow_back_ios_rounded,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Какую выплату прекратить?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                  ),
                                ),

                                const SizedBox(height: 16),

                                const Divider(),

                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Text(
                                    'Выберите тип вылпаты',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),

                                ...List.generate(
                                  _.applications.length,
                                  (index) => RadioListTile(
                                    value: _.applications[index].id,
                                    groupValue: _.selectedApplication,
                                    title: Text(
                                      'Выплата $index (${_.applications[index].dateCreate})',
                                    ),
                                    onChanged: (value) =>
                                        _.changePurpose(value),
                                  ),
                                ),

                                const Divider(),

                                const SizedBox(height: 16),

                                /// Поле с Снилс (берётся из логина)
                                MyTextField(
                                  enabled: false,
                                  hintText: 'СНИЛС',
                                  controller: _.snilsController,
                                ),

                                const SizedBox(height: 16),

                                /// Дата создания дата
                                MyTextField(
                                  enabled: false,
                                  hintText: 'Дата создания',
                                  controller: _.dateCreateController,
                                ),

                                const SizedBox(height: 16),

                                /// Текущая дата
                                MyTextField(
                                  enabled: false,
                                  hintText: 'Дата продления',
                                  controller: _.dateExtensionController,
                                ),

                                const SizedBox(height: 16),

                                /// Адрес проживания
                                MyTextField(
                                  enabled: false,
                                  hintText: 'Адрес проживания',
                                  controller: _.addressController,
                                ),

                                const SizedBox(height: 16),

                                /// Контактный телефон
                                MyTextField(
                                  enabled: false,
                                  hintText: 'Номер телефона',
                                  controller: _.phoneController,
                                ),

                                const SizedBox(height: 16),

                                /// Кнопка "Отправить"
                                MyElevatedButton(
                                  backgroundColor: Colors.red,
                                  title: 'Прекратить',
                                  onPressed: _.postTerminationApplication,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
