// ignore_for_file: avoid_print

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:pfr/pages/purpose/purpose_controller.dart';
import 'package:pfr/widgets/my_elevated_button.dart';
import 'package:pfr/widgets/my_text_field.dart';

/// Назначение выплаты
class PurposePage extends StatelessWidget {
  const PurposePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PurposeController _ = Get.put(PurposeController());

    final padding = (MediaQuery.of(context).size.width - 600) / 2;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: (padding <= 0) ? 16 : padding),
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

                    const SizedBox(height: 16),

                    /// Поле с Снилс (берётся из логина)
                    const MyTextField(hintText: 'СНИЛС'),

                    const SizedBox(height: 16),

                    /// Текущая дата

                    const MyTextField(hintText: 'Дата'),

                    const SizedBox(height: 16),

                    /// Адрес проживания
                    const MyTextField(hintText: 'Адрес проживания'),

                    const SizedBox(height: 16),

                    /// Контактный телефон
                    const MyTextField(hintText: 'Номер телефона'),

                    const SizedBox(height: 16),

                    /// Комментарий к заявке
                    const MyTextField(
                      hintText: 'Комментарий к заявке',
                      keyboardType: TextInputType.multiline,
                    ),

                    const SizedBox(height: 16),

                    /// Кнопочку прикрепить документы (pdf)

                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: (_.isHighlighter.value) ? Colors.grey : Colors.blueGrey,
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
                                onCreated: (controller) => _.dropzoneController = controller,
                                onDrop: _.acceptFile,
                                onHover: () => _.isHighlighter.value = true,
                                onLeave: () => _.isHighlighter.value = false,
                              ),
                              Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () async => await _.pickFiles(),
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
                    ),

                    const SizedBox(height: 16),

                    /// Кнопка "Отправить"
                    MyElevatedButton(
                      title: 'Отправить',
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
