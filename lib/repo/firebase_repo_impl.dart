import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:juice_code_test/repo/firebase_repo.dart';
import 'package:uuid/uuid.dart';

class FirebaseRepoImpl implements FirebaseRepo {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _cloudStorage = FirebaseFirestore.instance;

  static final FirebaseRepoImpl _singleton = FirebaseRepoImpl._internal();

  factory FirebaseRepoImpl() {
    return _singleton;
  }

  FirebaseRepoImpl._internal();

  @override
  Future uploadToFirebase(Uint8List imageBytes, String name) async {
    try {
      Reference ref = _storage.ref().child('images');
      String id = const Uuid().v1();
      ref = ref.child(id);
      final result = await ref.putData(
        imageBytes,
        SettableMetadata(contentType: 'image/png'),
      );
      String imageUrl = await result.ref.getDownloadURL();
      Map<String, dynamic> data = {
        'photo': imageUrl,
        'name': name,
        'time': DateTime.now().microsecondsSinceEpoch
      };
      return await _cloudStorage.collection('detections').add(data);
    } catch (e) {
      if (e is FirebaseException) {
        return Future.error(e.message.toString());
      } else {
        return Future.error("Something Went Wrong");
      }
    }
  }

  @override
  Stream<QuerySnapshot> getList() {
    return _cloudStorage
        .collection('detections')
        .orderBy('time', descending: true)
        .snapshots();
  }
}
