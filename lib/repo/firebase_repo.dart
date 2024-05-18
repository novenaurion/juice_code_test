import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';


abstract class FirebaseRepo{


  Future uploadToFirebase(Uint8List imageBytes,String name);

  Stream<QuerySnapshot> getList();
}