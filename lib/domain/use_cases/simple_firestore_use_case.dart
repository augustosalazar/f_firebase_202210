import 'package:f_firebase_202210/data/model/document.dart';
import 'package:f_firebase_202210/domain/repositories/i_simple_firestore_repository.dart';

class SimpleFirestoreUseCase {
  ISimpleFirestoreRepository _simpleFirestoreRepository;

  SimpleFirestoreUseCase(this._simpleFirestoreRepository);

  Future<List<Document>> getDocuments() async {
    return await _simpleFirestoreRepository.getDocuments();
  }

  Future<void> updateDocument(Document record) async {
    await _simpleFirestoreRepository.updateDocument(record);
  }

  Future<void> deleteDocument(Document record) async {
    await _simpleFirestoreRepository.deleteDocument(record);
  }

  Future<void> addDocument(String value) async {
    await _simpleFirestoreRepository
        .addDocument(Document(name: value, votes: 0));
  }
}
