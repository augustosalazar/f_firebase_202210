import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_firebase_202210/data/model/document.dart';

class SimpleFirestoreDataSource {
  final FirebaseFirestore _firestore;

  SimpleFirestoreDataSource(this._firestore);

  Future<void> addDocument(Document document) async {
    await _firestore.collection('documents').add(document.toJson());
  }

  Future<void> deleteDocument(Document document) {
    return _firestore.collection('documents').doc(document.key).delete();
  }

  Future<List<Map<String, dynamic>>> getDocuments() async {
    final snapshot = await _firestore.collection('documents').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateDocument(Document document) async {
    return await _firestore
        .collection('documents')
        .doc(document.key)
        .update(document.toJson());
  }
}
