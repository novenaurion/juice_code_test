import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../repo/firebase_repo.dart';
import '../../repo/firebase_repo_impl.dart';

class DetectionListController extends GetxController{

  final FirebaseRepo _firebaseRepo = FirebaseRepoImpl();


  Stream<QuerySnapshot> getUser(){
    return _firebaseRepo.getList();
  }


}