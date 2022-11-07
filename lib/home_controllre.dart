import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxDouble height = 50.0.obs;
  RxInt weight = 0.obs;
  RxInt Age = 0.obs;
  RxBool select = false.obs;
  RxBool selected = false.obs;
  RxDouble bmi = 0.0.obs;
  String msg1 = "";
  String msg2 = "";

  void bmicalculate()
  {
    double heightn = height/100;
    bmi.value = (weight/(heightn*heightn));
  }

  void changevalue(double value)
  {
    height.value = value;
    update();
  }

  String? Result() {
    if (bmi > 25) {
      msg1= 'Overweight';
    } else if (bmi > 18.5) {
      msg1= 'Normal';
    } else if(bmi<18.5){
      msg1= 'Underweight';
    }
    return msg1;
  }

  String? Interpretation() {
    if (bmi >= 25) {
      msg2= 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      msg2= 'You have a normal body weight. Good job!';
    } else {
      msg2= 'You have a lower than normal body weight. You can eat a bit more.';
    }
    return msg2;
  }

  void clear(){
    Age.value = 0;
    weight.value = 0;
    height.value = 50;
    select.value = false;
    selected.value = false;
    update();
  }

}