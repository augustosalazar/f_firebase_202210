import 'package:get/get.dart';

import '../../data/model/record.dart';

class FirestoreController extends GetxController {
  var _records = <Record>[].obs;

  get entries => _records;

  void suscribeUpdates() {}

  updateEntry(Record record) {}

  deleteEntry(Record record) {}

  void addEntry(String value) {}
}
