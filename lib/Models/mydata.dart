class MyData {
  int? id;
  final String encryptedText;

  MyData({this.id, required this.encryptedText});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'encryptedText': encryptedText,
    };
  }

  factory MyData.fromMap(Map<String, dynamic> map) {
    return MyData(
      id: map['id'],
      encryptedText: map['encryptedText'],
    );
  }
}
