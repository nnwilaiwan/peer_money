import 'package:encrypt/encrypt.dart';

class MyEncryptionDecryption {
  final aes_secret = Key.fromUtf8(
      '9a9eb89b5ed9388720a8d23b328e79244b0b809a07f1829c22744ed2fde883be');
  final key = Key.fromUtf8('MySecretKeyForEncryptionAndDecry'); //32 chars
  // final iv = IV.fromUtf8('helloworldhellow'); //16 chars
  final iv = IV.fromLength(6);

//   Flutter encryption
  String encryp(String text) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(text, iv: iv);
    print('text : $text');
    // print('encrypted : ${encrypted}');

    print('encrypted : ${encrypted.base64}');

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
