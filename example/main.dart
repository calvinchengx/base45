import 'dart:convert';
import 'dart:typed_data';

import 'package:base45/base45.dart';

void main() {
  var str = 'Hello!!';
  var encoded = utf8.encode(str);
  var base45EncodedString = Base45.encode(Uint8List.fromList(encoded));
  print(base45EncodedString);
}
