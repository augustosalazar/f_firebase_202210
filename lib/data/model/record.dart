//import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  String name = "";
  int votes = 0;
  // final DocumentReference reference;

  // Record.fromMap(Map<String, dynamic> map, {required this.reference})
  //     : assert(map['name'] != null),
  //       assert(map['votes'] != null),
  //       name = map['name'],
  //       votes = map['votes'];

  // Record.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data() as Map<String, dynamic>,
  //           reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}
