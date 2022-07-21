import 'package:encrypt/encrypt.dart';

class MyEncryptionDecryption {
  final aes_secret = Key.fromUtf8(
      '9a9eb89b5ed9388720a8d23b328e79244b0b809a07f1829c22744ed2fde883be');
  // final key = Key.fromUtf8('MySecretKeyForEncryptionAndDecry'); //32 chars
  // final iv = IV.fromUtf8('helloworldhellow'); //16 chars
  final iv = IV.fromLength(16);
  final key = Key.fromLength(32);
//   Flutter encryption
  String encryp(String text) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    print('text : $text');
    // print('encrypted : ${encrypted}');

    print('encrypted : ${encrypted.base64}');
     print('encrypted length: ${encrypted.base64.length}');


    return encrypted.base64;
  }

//Flutter decryption
  String decryp(String text) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
    print('decryption : $decrypted');
    return decrypted;
  }
}

class AesEncryptionDecryption {
  static final key = Key.fromLength(32);
  static final iv = IV.fromLength(16);

  static final encrypter = Encrypter(AES(key));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted;
  }

  static encryptKey(text) {
    final encrypted = encrypter.encryptBytes(text, iv: iv);
    return encrypted as List<int>;
  }

  static String decryptAES(String base64Text) {
    print(base64Text);
    String decrypted = encrypter.decrypt(
      Encrypted.fromBase64(base64Text),
      iv: iv,
    );
    print(decrypted);
    return decrypted;
  }
}

