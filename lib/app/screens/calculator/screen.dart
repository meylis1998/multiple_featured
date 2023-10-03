import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/app.dart';
import 'package:test_app/app/global/base_app.dart';

import '../../core/themes/colors.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return BaseApp(
      horizontalPadding: 30,
      verticalPadding: 40,
      backgroundColor: ThemeColor.white,
      appBarBackgroundColor: ThemeColor.white,
      title: Text(
        'Calculator',
        style: Get.textTheme.bodyMedium,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${controller.firstNumber.value} ${controller.operator.value} ${controller.secondNumber.value}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                controller.result.value,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('7'),
                _buildNumberButton('8'),
                _buildNumberButton('9'),
                _buildOperatorButton('/'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('4'),
                _buildNumberButton('5'),
                _buildNumberButton('6'),
                _buildOperatorButton('*'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('1'),
                _buildNumberButton('2'),
                _buildNumberButton('3'),
                _buildOperatorButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('0'),
                _buildOperatorButton('+'),
                _buildOperatorButton('='),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.clear();
              },
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String text) {
    return ElevatedButton(
      onPressed: () {
        controller.updateNumber(text);
      },
      child: Text(text),
    );
  }

  Widget _buildOperatorButton(String text) {
    return ElevatedButton(
      onPressed: () {
        if (text == '=') {
          controller.calculateResult();
        } else {
          controller.updateOperator(text);
        }
      },
      child: Text(text),
    );
  }
}
