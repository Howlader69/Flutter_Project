import 'package:get/get.dart';

class MainBottomNavController extends GetxController{
  int CurrentSelectedIndex=0;

  void changeScreen(int index){
    CurrentSelectedIndex=index;
    update();
  }

  void Backtohome(){
    changeScreen(0);
  }
}
