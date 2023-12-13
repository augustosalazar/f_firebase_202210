import 'dart:async';

import 'package:f_firebase_202210/data/data_source/i_user_data_source.dart';
import 'package:f_firebase_202210/data/model/app_user.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:loggy/loggy.dart';

class FirebaseRealTimeDatabaseUserDataSource implements IUserDataSource {
  final _firebaseDatabase = FirebaseDatabase.instance.ref();
  @override
  Future<void> createUser(email, uid) async {
    logInfo("Creating user in realTime for $email and $uid");
    try {
      await _firebaseDatabase
          .child('userList')
          .push()
          .set({'email': email, 'uid': uid});
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }

  @override
  Stream<List<AppUser>> getUsers() {
    return _firebaseDatabase
        .child('userList')
        .onValue
        .map((event) {
          if (event.snapshot.value is Map) {
            return Map<String, dynamic>.from(event.snapshot.value as Map);
          } else {
            logError('Error getUsers');
            throw TypeError();
          }
        })
        .map((messages) => messages.entries
            .map((entry) => AppUser.fromJson(entry.value))
            .toList())
        .transform<List<AppUser>>(StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            sink.add(data);
          },
          handleError: (error, stackTrace, sink) {
            logInfo('Sending empty list');
            sink.add([]);
          },
        ));
  }
}
