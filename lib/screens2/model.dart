import 'dart:math';

class CalculatorBMI {
  final int height;
  final int weight;
  double result;
  String msg = "";

  CalculatorBMI(this.height, this.weight, this.result, this.msg);
  String calculatorResult() {
    result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(1);
  }

  descriptionView() {
    if (result > 25) {
      msg = "Over Weight";
      return "you have a higher weight then normal,try to lose your weight through any activity you way";
    } else if (result > 18.5) {
      msg = "Normal Weight";
      return "you have a normal weight keep it";
    } else if (result < 18.5) {
      msg = "Under Weight";
      return "you have is less than normal weight to please gain some weight";
    }
    return 0;
  }
}
