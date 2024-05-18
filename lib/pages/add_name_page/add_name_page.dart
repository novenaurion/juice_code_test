import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juice_code_test/pages/add_name_page/add_name_page_controller.dart';
import 'package:juice_code_test/widgets/all_dialog.dart';
import 'package:juice_code_test/widgets/custom_button_view.dart';

import '../../utils/responsive_layout.dart';
import '../../widgets/text_form_field_view.dart';
import '../DetectionListPage/detection_list_page.dart';

class AddNamePage extends StatelessWidget {
  AddNamePage({
    super.key,
  });

  static String get route => '/add-name';
  static String get title => 'Add Name Page';


  final AddNamePageController mAddNameController =
      Get.find<AddNamePageController>();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Obx(
          ()=> mAddNameController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              :  Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image.memory(
                  key: Key("image-view"),
                  mAddNameController.imageBytes,
                  height: 200,
                  width: 200,
                ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: isMobile ? double.infinity : 300,
                child: TextFormFiledView(
                  key: Key("enter-name-field"),
                  controller: mAddNameController.nameEditingController,
                  hintText: "Enter Your Name",
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButtonView(
                key: Key("add-button"),
                buttonText: "Add",
                onPressed: () async {
                  AllDialog.showLoadingDialog(context);
                  try {
                    await mAddNameController.addUser!();
                    Navigator.of(context).pop();
                    AllDialog.showErrorSuccessDialog(
                        context: context,
                        title: "Success",
                        confirm: "Go To Home",
                        subtitle: "The user is successfully added ",
                        isSuccess: true,
                        onConfirm: () {
                          Navigator.of(context).pop();
                          Get.offAllNamed(DetectionListPage.route);
                        });
                  } catch (error) {
                    Navigator.of(context).pop();
                    AllDialog.showErrorSuccessDialog(
                        context: context,
                        title: "Error",
                        confirm: "Try Again",
                        subtitle: error.toString(),
                        isSuccess: false,
                        onConfirm: () {
                          Navigator.of(context).pop();
                        });
                  }
                },
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
