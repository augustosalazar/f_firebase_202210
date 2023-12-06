//import 'package:firebase_database/firebase_database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Message {
  String? key;
  String textMessage;
  String user;

  Message({required this.textMessage, required this.user});

  //implement fromJSon2 that takes a QueryDocumentSnapshot<Object?> and returns a Message
  Message.FromFirestore(QueryDocumentSnapshot<Object?> snapshot)
      : key = snapshot.id,
        user = snapshot['uid'] ?? "uid",
        textMessage = snapshot['text'] ?? "text";

  // Message.fromJsonWithQuery(QueryDocumentSnapshot snapshot)
  //     : key = snapshot.id,
  //       user = snapshot['user'] ?? "uid",
  //       textMessage = snapshot['text'] ?? "text";

  // Message.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
  //     : key = snapshot.key ?? "0",
  //       user = json['user'] ?? "uid",
  //       textMessage = json['text'] ?? "text";

  Message.fromJsonSimple(Map<dynamic, dynamic> json)
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
