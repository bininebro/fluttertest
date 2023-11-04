import 'package:flutter/material.dart';
import 'package:test_nterview/Models/mydata.dart';
import 'package:test_nterview/ViewModels/database_connection.dart';

import 'encryption.dart';

class HomeViewModel extends ChangeNotifier {
  DatabaseConnection dataBaseConnection = DatabaseConnection();
  late List<String> decryptedList;
  Encryption encryption = Encryption();
  HomeViewModel() {
    dataBaseConnection.init();
  }
  void updateMessage(String newMessage) {
    var encryptedText = encryption.encryptText(newMessage);
    dataBaseConnection.insertData(MyData(encryptedText: encryptedText));
    notifyListeners(); // Notify listeners when data changes
  }
}
