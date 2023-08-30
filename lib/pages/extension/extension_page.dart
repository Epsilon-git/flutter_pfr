import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfr/pages/extension/extension_controller.dart';

/// Продление выплаты
class ExtensionPage extends StatelessWidget {
  const ExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ExtensionController _ = Get.put(ExtensionController());

    return Scaffold(
      appBar: AppBar(title: const Text('Page')),
      body: Container(),
    );
  }
}
