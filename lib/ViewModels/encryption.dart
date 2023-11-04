import 'package:encrypt/encrypt.dart';
import 'dart:convert';

class Encryption {
  final key = Key.fromUtf8('my32lengthsupersecretnooneknows2');
  final iv = IV.fromLength(16);

  String encryptText(String plainText) {
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    final encrypted = encrypter.encrypt(plainText);
    return encrypted.base64;
  }

  String decryptText(String encryptedText) {
    final b64key = Key.fromUtf8(base64Url.encode(key.bytes).substring(0, 32));
    // if you need to use the ttl feature, you'll need to use APIs in the algorithm itself
    final fernet = Fernet(b64key);
    final encrypter = Encrypter(fernet);
    return encrypter.decrypt(Encrypted.fromBase64(encryptedText));
  }
}
