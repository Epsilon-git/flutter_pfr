import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfr/pages/termination/termination_controller.dart';

/// Прекращение выплаты
class TerminationPage extends StatelessWidget {
  const TerminationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TerminationController _ = Get.put(TerminationController());

    return Scaffold(
      appBar: AppBar(title: const Text('Page')),
      body: Container(),
    );
  }
}
