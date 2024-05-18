import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:juice_code_test/widgets/custom_button_view.dart';

import '../../utils/responsive_layout.dart';
import 'get_image_page_controller.dart';

class GetImagePage extends GetView {
  GetImagePage({super.key});

  static String get route => '/get-image';
  static String get title => 'Get Image Page';

  final GetImagePageController mGetImagePageController = Get.find<GetImagePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Obx(
          () => mGetImagePageController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : mGetImagePageController.isError.value == true
                  ? Center(
                      child: Text(mGetImagePageController.errorText.value,key: Key("error-text"),),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height:
                              ResponsiveLayout.getScreenHeight(context) * 0.8,
                          width: ResponsiveLayout.getScreenWidth(context),
                          child: CameraPreview(
                              key: Key("camera-view"),
                              mGetImagePageController.controller),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomButtonView(
                          key: Key("capture-button"),
                          buttonText: "Capture",
                          width: 200,
                          onPressed: () {
                            mGetImagePageController.capture();
                          },
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}
