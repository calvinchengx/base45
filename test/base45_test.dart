import 'dart:typed_data';
import 'dart:convert';

import 'package:base45/base45.dart';
import 'package:test/test.dart';

void main() {
  test('decode -empty-', () {
    expect(Base45.decode(''), []);
  });
  test('decode 00', () {
    expect(Base45.decode('00'), [0]);
  });
  test('decode 000', () {
    expect(Base45.decode('000'), [0, 0]);
  });

  test('decode example 1 - %69 VD92EX0 -> Hello!!', () {
    expect(Base45.decode('%69 VD92EX0'), [72, 101, 108, 108, 111, 33, 33]);
  });

  test('decode example 2 - UJCLQE7W581 -> base-45', () {
    expect(Base45.decode('UJCLQE7W581'), [98, 97, 115, 101, 45, 52, 53]);
  });

  test('decode example 3 - QED8WEX0 ->ietf!', () {
    expect(Base45.decode('QED8WEX0'), [105, 101, 116, 102, 33]);
  });

  test('decode convenience - UJCLQE7W581 -> base-45', () {
    expect(String.fromCharCodes(Base45.decode('UJCLQE7W581')), 'base-45');
  });

  test('encode empty list', () {
    expect(() => Base45.encode(Uint8List.fromList([])), throwsException);
  });

  test('encode array [0]', () {
    expect(Base45.encode(Uint8List.fromList([0])), '00');
  });

  test('encode array [0, 0]', () {
    expect(Base45.encode(Uint8List.fromList([0, 0])), '000');
  });

  test('encode array [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]', () {
    expect(
        Base45.encode(Uint8List.fromList([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])),
        '000000000000000000');
  });

  test('encode example 1 - Hello!!', () {
    var str = 'Hello!!';
    var encoded = utf8.encode(str);
    expect(Base45.encode(Uint8List.fromList(encoded)), '%69 VD92EX0');
  });

  test('encode example 2 - base-45', () {
    var str = 'base-45';
    var encoded = utf8.encode(str);
    expect(Base45.encode(Uint8List.fromList(encoded)), 'UJCLQE7W581');
  });

  test('encode example 3 - ietf!', () {
    var str = 'ietf!';
    var encoded = utf8.encode(str);
    expect(Base45.encode(Uint8List.fromList(encoded)), 'QED8WEX0');
  });
}
