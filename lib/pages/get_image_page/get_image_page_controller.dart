
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:juice_code_test/pages/add_name_page/add_name_page.dart';

class GetImagePageController extends GetxController {
  List<CameraDescription>? cameras;
  late CameraController controller;

  RxBool isLoading = true.obs;
  RxBool isError = false.obs;
  RxString errorText = " ".obs;

  @override
  onInit() {
    super.onInit();
    initCamera();
  }

  @override
  onClose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    isLoading.value = true;
    try {
      cameras = await availableCameras();
      controller = CameraController(cameras!.first, ResolutionPreset.max,
          enableAudio: false);
      await controller.initialize();
      isLoading.value = false;
    } catch (e) {
      print('e==>${e.toString()}');
      isLoading.value = false;
      isError.value = true;
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            errorText.value = "Please Allow Camera Access";
            break;
          default:
            errorText.value = "Something Went Wrong";
            break;
        }
      }
    }
  }

  Future<void> capture() async {
    final XFile picture = await controller.takePicture();
    var bytes = await picture.readAsBytes();
    Get.toNamed(AddNamePage.route, arguments: bytes);
  }

  @override
  void dispose() {
    controller.dispose();
  }
}
