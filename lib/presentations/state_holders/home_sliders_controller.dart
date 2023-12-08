
import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/models/slider_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class HomeSlidersController extends GetxController {
  bool _getHomeSlidersInProgress = false;
  CategoryModel _sliderModel = CategoryModel();
  String _message = '';

  CategoryModel get sliderModel => _sliderModel;

  bool get getHomeSlidersInProgress => _getHomeSlidersInProgress;

  String get message => _message;

  Future<bool> getHomeSliders() async {
    _getHomeSlidersInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getHomeSliders);
    _getHomeSlidersInProgress = false;
    if (response.isSuccess) {
      _sliderModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Sliders data fetch failed!';
      update();
      return false;
    }
  }
}