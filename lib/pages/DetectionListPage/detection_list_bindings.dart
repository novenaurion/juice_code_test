import 'package:get/get.dart';

import 'detection_list_controller.dart';

class DetectionListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetectionListController(),
    );
  }
}
