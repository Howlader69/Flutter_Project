import 'package:ecomerce_project/presentations/state_holders/base_state_controller.dart';

class HomeController extends BaseStateController{
  @override
  Future<bool> call(BaseParams params) {
   throw UnimplementedError();
  }
  
}
class HomeParams extends BaseParams{
   final String userName;
  final String password;

  HomeParams(this.userName, this.password);
}
main(){
  HomeParams params=HomeParams('dafa', 'password');
  HomeController homeController=HomeController();
  homeController.call(params);
}