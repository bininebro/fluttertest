import 'package:encrypt/encrypt.dart';

class Encryption {
  final key = Key.fromUtf8('your_secret_key');
  final iv = IV.fromLength(16);

  String encryptText(String text) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  String decryptText(String encryptedText) {
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
