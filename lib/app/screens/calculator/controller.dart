import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = '0'.obs;
  var secondNumber = '0'.obs;
  var operator = ''.obs;
  var result = '0'.obs;

  void updateNumber(String value) {
    if (operator.value.isEmpty) {
      firstNumber.value = (firstNumber.value == '0') ? value : firstNumber.value + value;
    } else {
      secondNumber.value = (secondNumber.value == '0') ? value : secondNumber.value + value;
    }
  }

  void updateOperator(String value) {
    operator.value = value;
  }

  void calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(secondNumber.value);

    switch (operator.value) {
      case '+':
        result.value = (num1 + num2).toString();
        break;
      case '-':
        result.value = (num1 - num2).toString();
        break;
      case '*':
        result.value = (num1 * num2).toString();
        break;
      case '/':
        if (num2 != 0) {
          result.value = (num1 / num2).toString();
        } else {
          result.value = 'Error';
        }
        break;
      default:
        result.value = 'Error';
    }
  }

  void clear() {
    firstNumber.value = '0';
    secondNumber.value = '0';
    operator.value = '';
    result.value = '0';
  }
}
