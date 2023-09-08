import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:pfr/constants.dart';
import 'package:pfr/pages/purpose/purpose_controller.dart';
import 'package:pfr/routes/app_routes.dart';
import 'package:pfr/widgets/load_indicator_widget.dart';
import 'package:pfr/widgets/my_container.dart';
import 'package:pfr/widgets/my_elevated_button.dart';
import 'package:pfr/widgets/my_text_field.dart';

/// Назначение выплаты
class PurposePage extends StatelessWidget {
  const PurposePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurposeController>(
      init: PurposeController(),
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
                              onTap: () => Get.offAllNamed(Routes.dashboard),
                              child: const Icon(Icons.arrow_back_ios_rounded),
                            ),
                          ),
                          const Text(
                            'Назначение выплаты',
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
                            _.payments.length,
                            (index) => RadioListTile(
                              value: _.payments[index].id,
                              groupValue: _.selectedPayment,
                              title: Text(_.payments[index].title),
                              onChanged: _.changePayment,
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

                          /// Текущая дата
                          MyTextField(
                            hintText: 'Дата',
                            controller: _.dateCreateController,
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
                          const DropzoneWidget(),

                          const SizedBox(height: 16),

                          /// Кнопка "Отправить"
                          MyElevatedButton(
                            title: 'Отправить',
                            onPressed: _.postApplication,
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

class DropzoneWidget extends StatelessWidget {
  const DropzoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final c = PurposeController.to;

    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: (c.isHighlighter.value) ? Colors.grey : Colors.blueGrey,
        ),
        height: 200,
        child: DottedBorder(
          color: Colors.white,
          radius: const Radius.circular(15.0),
          strokeWidth: 3,
          strokeCap: StrokeCap.round,
          dashPattern: const [14.0],
          child: Stack(
            children: [
              DropzoneView(
                onCreated: (controller) => c.dropzoneController = controller,
                onDrop: c.acceptFile,
                onHover: () => c.isHighlighter.value = true,
                onLeave: () => c.isHighlighter.value = false,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () async => await c.pickFiles(),
                      child: const Text(
                        'Выберете документ ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      'или перетащите',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
