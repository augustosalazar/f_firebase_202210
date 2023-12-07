import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

import '../../data/model/document.dart';
import '../controllers/simple_firestore_controller.dart';

class SimpleFireStorePage extends StatefulWidget {
  const SimpleFireStorePage({super.key});

  @override
  State<SimpleFireStorePage> createState() => _SimpleFireStorePageState();
}

class _SimpleFireStorePageState extends State<SimpleFireStorePage> {
  final SimpleFirestoreController firestoreController = Get.find();

  @override
  void initState() {
    firestoreController.suscribeUpdates();
    super.initState();
  }

  @override
  void dispose() {
    firestoreController.suscribeUpdates();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => ListView.builder(
              itemCount: firestoreController.entries.length,
              padding: const EdgeInsets.only(top: 20.0),
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(context, firestoreController.entries[index]);
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addBaby(context);
          },
        ));
  }

  Widget _buildItem(BuildContext context, Document record) {
    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => firestoreController.updateDocument(record),
          onLongPress: () => firestoreController.deleteDocument(record),
        ),
      ),
    );
  }

  Future<void> addBaby(BuildContext context) async {
    getName(context).then((value) {
      firestoreController.addDocument(value);
    });
  }

  Future<String> getName(BuildContext context) async {
    String? result = await prompt(
      context,
      title: const Text('Adding a baby'),
      initialValue: '',
      textOK: const Text('Ok'),
      textCancel: const Text('Cancel'),
      hintText: 'Baby name',
      minLines: 1,
      autoFocus: true,
      obscureText: false,
      textCapitalization: TextCapitalization.words,
    );
    if (result != null) {
      return Future.value(result);
    }
    return Future.error('cancel');
  }
}
