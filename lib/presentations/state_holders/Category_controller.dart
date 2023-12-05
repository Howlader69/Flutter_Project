import 'package:get/get.dart';
import '../../data/models/category_model.dart';
import '../../data/models/network_response.dart';
import '../../data/services/network_caller.dart';
import '../../data/utility/urls.dart';

class CategoryController extends GetxController {
  bool _getCategoriesInProgress = false;
  CategoryModel _categoryModel = CategoryModel();
  String _message = '';

  CategoryModel get categoryModel => _categoryModel;
  bool get getCategoriesInProgress => _getCategoriesInProgress;
  String get message => _message;
  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.getCategories);
    _getCategoriesInProgress = false;
    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Sliders data fetch failed!';
      update();
      return false;
    }
  }
}