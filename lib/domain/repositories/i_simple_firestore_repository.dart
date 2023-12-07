import 'package:f_firebase_202210/data/data_source/simple_firestore_data_source.dart';
import 'package:f_firebase_202210/data/model/document.dart';

abstract class ISimpleFirestoreRepository {
  final SimpleFirestoreDataSource _simpleFirestoreDataSource;

  ISimpleFirestoreRepository(this._simpleFirestoreDataSource);

  Future<List<Document>> getDocuments();

  Future<void> addDocument(Document document);

  Future<void> updateDocument(Document document);

  Future<void> deleteDocument(Document document);
}
