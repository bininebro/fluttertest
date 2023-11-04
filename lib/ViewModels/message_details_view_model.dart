import 'database_connection.dart';
import 'encryption.dart';
import 'package:flutter/material.dart';

class MessageDetailViewModel extends ChangeNotifier {
  DatabaseConnection dataBaseConnection = DatabaseConnection();
  List<String>? decryptedList;
  Encryption encryption = Encryption();
  MessageDetailViewModel() {
    dataBaseConnection.init().whenComplete(() async => await listMessage());
  }
  Future<void> listMessage() async {
    var encryptedList = await dataBaseConnection.fetchData();
    decryptedList = encryptedList
        .map((e) => encryption.decryptText(e.encryptedText))
        .toList();
    notifyListeners(); // Notify listeners when data changes
  }
}
