import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/pages/extension/extension_controller.dart';
import 'package:pfr/routes/app_routes.dart';
import 'package:pfr/widgets/load_indicator_widget.dart';
import 'package:pfr/widgets/my_container.dart';
import 'package:pfr/widgets/my_elevated_button.dart';
import 'package:pfr/widgets/my_text_field.dart';

/// Продление выплаты
class ExtensionPage extends StatelessWidget {
  const ExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExtensionController>(
      init: ExtensionController(),
      builder: (_) {
        if (_.loadState == LoadState.isLoad) return const LoadIndicatorWidget();

        return Scaffold(
          body: SingleChildScrollView(
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
                              onTap: () => Get.toNamed(Routes.dashboard),
                              child: const Icon(Icons.arrow_back_ios_rounded),
                            ),
                          ),
                          const Text(
                            'Выберите выплату для продления',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                          ),

                          const SizedBox(height: 16),

                          const Divider(),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
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
                            _.purposes.length,
                            (index) => RadioListTile(
                              value: _.purposes[index].id,
                              groupValue: _.selectedPurpose,
                              title: Text(
                                'Выплата $index (${_.purposes[index].date})',
                              ),
                              onChanged: (value) => _.changePurpose(value),
                            ),
                          ),

                          const Divider(),

                          const SizedBox(height: 16),

                          /// Поле с Снилс (берётся из логина)
                          MyTextField(
                            hintText: 'СНИЛС',
                            controller: _.snilsController,
                          ),

                          const SizedBox(height: 16),

                          /// Дата создания дата
                          MyTextField(
                            hintText: 'Дата создания',
                            controller: _.dateCreateController,
                          ),

                          const SizedBox(height: 16),

                          /// Текущая дата
                          MyTextField(
                            hintText: 'Дата',
                            controller: _.dateController,
                          ),

                          const SizedBox(height: 16),

                          /// Адрес проживания
                          MyTextField(
                            hintText: 'Адрес проживания',
                            controller: _.addressController,
                          ),

                          const SizedBox(height: 16),

                          /// Контактный телефон
                          MyTextField(
                            hintText: 'Номер телефона',
                            controller: _.phoneController,
                          ),

                          const SizedBox(height: 16),

                          /// Комментарий к заявке
                          MyTextField(
                            hintText: 'Комментарий к заявке',
                            keyboardType: TextInputType.multiline,
                            controller: _.commentController,
                          ),

                          const SizedBox(height: 16),

                          /// Кнопочку прикрепить документы (pdf)

                          const SizedBox(height: 16),

                          /// Кнопка "Отправить"
                          MyElevatedButton(
                            title: 'Отправить',
                            onPressed: () {},
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
