//import 'package:firebase_database/firebase_database.dart';

class Message {
  String? key;
  String textMessage;
  String user;

  Message({required this.textMessage, required this.user});

  Message.FromFirestore(Map<String, dynamic> record)
      : key = record['key'] ?? "0",
        user = record['uid'] ?? "uid",
        textMessage = record['text'] ?? "text";

  Message.fromJson(Map<dynamic, dynamic> json)
      : key = json['key'] ?? "0",
        user = json['user'] ?? "uid",
        textMessage = json['text'] ?? "text";

  toJson() {
    return {
      "key": key,
      "text": textMessage,
      "user": user,
    };
  }
}
