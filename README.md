# base45 implementation in dartlang

This implementation is based on an internet draft.

This document describes the Base45 encoding scheme which is built upon the Base64, Base32 and Base16 encoding schemes - https://datatracker.ietf.org/doc/draft-faltstrom-base45/ 

Internet-Drafts are draft documents valid for a maximum of six months and may be updated, replaced, or obsoleted by other documents at any time.  It is inappropriate to use Internet-Drafts as reference material or to cite them other than as "work in progress."

This Internet-Draft will expire on December 16, 2021.

## When to use Base45?

If binary data is to be stored in a QR-Code one possible way is to use the Alphanumeric mode that uses 11 bits for 2 characters asdefined in section 7.3.4 in ISO/IEC 18004:2015 [ISO18004].  The ECI mode indicator for this encoding is 0010.

If the data is to be sent via some other transport, a transport encoding suitable for that transport should be used instead of Base45.  It is not recommended to first encode data in Base45 and then encode the resulting string in for example Base64 if the data is to be sent via email.  Instead the Base45 encoding should be removed, and the data itself should be encoded in Base64.

## Installation

```bash
flutter pub add base45
```

or

```bash
dart pub add base45
```

## Import

```bash
import 'package:base45/base45.dart';
```

## Usage

```bash
# encoding
String str = 'Hello!!';
List<int> encoded = utf8.encode(str);
String base45EncodedString = Base45.encode(Uint8List.fromList(encoded);

# decoding
String decodedStr = Base45.decode('%69 VD92EX0');
```

## Tests

```bash
dart test
```
