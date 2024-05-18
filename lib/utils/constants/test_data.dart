import 'dart:typed_data';

import 'package:flutter/services.dart';



Future<Uint8List> getTestImage() async {
 final ByteData bytes = await rootBundle.load('assets/images/test.png');
 final Uint8List list = bytes.buffer.asUint8List();
 return list;
}