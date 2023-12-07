import 'package:get/get.dart';

import '../../data/model/document.dart';

class SimpleFirestoreController extends GetxController {
  final _records = <Document>[].obs;

  get entries => _records;

  void suscribeUpdates() {}

  updateDocument(Document record) {}

  deleteDocument(Document record) {}

  void addDocument(String value) {}
}
