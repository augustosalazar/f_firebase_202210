import 'package:firebase_database/firebase_database.dart';

class User {
  String? key;
  String email;
  String uid;

  User(this.key, this.email, this.uid);

  User.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        email = json['email'] ?? "email",
        uid = json['email'] ?? "email";

  toJson() {
    return {
      "email": email,
      "uid": uid,
    };
  }
}
