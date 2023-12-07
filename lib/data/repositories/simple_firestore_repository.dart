import 'package:f_firebase_202210/data/data_source/simple_firestore_data_source.dart';
import 'package:f_firebase_202210/data/model/document.dart';

import '../../domain/repositories/i_simple_firestore_repository.dart';

class SimpleFirestoreRepository implements ISimpleFirestoreRepository {
  SimpleFirestoreDataSource _simpleFirestoreDataSource;

  SimpleFirestoreRepository(this._simpleFirestoreDataSource);

  @override
  Future<void> addDocument(Document document) async {
    await _simpleFirestoreDataSource.addDocument(document);
  }

  @override
  Future<void> deleteDocument(Document document) {
    // TODO: implement deleteDocument
    throw UnimplementedError();
  }

  @override
  Future<List<Document>> getDocuments() {
    // TODO: implement getDocuments
    throw UnimplementedError();
  }

  @override
  Future<void> updateDocument(Document document) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }
}
