import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:juice_code_test/repo/firebase_repo_impl.dart';
import 'package:juice_code_test/utils/constants/test_data.dart';

import '../../repo/firebase_repo.dart';

class AddNamePageController extends GetxController {
  TextEditingController nameEditingController = TextEditingController();
  final FirebaseRepo _firebaseRepo = FirebaseRepoImpl();

  late Uint8List imageBytes;

  Rx<bool> isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setImage();
  }

  Future addUser() {
    if(nameEditingController.text.isEmpty){
      return Future.error("Please Enter Name");
    }
    return _firebaseRepo.uploadToFirebase(
        imageBytes, nameEditingController.text);
  }

  Future<void> setImage() async {

    imageBytes = Get.arguments ?? await getTestImage();
    isLoading.value = false;
  }
}
