import 'package:get/get.dart';
import 'package:juice_code_test/pages/add_name_page/add_name_page_controller.dart';

class AddNamePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNamePageController());
  }
}
