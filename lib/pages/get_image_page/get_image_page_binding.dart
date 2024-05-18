import 'package:get/get.dart';

import 'get_image_page_controller.dart';

class GetImagePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetImagePageController());
  }
}
