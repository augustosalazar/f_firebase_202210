import 'package:f_firebase_202210/ui/firebase_cental.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/configutarion.dart';
import 'controllers/authentication_controller.dart';
import 'controllers/chat_controller.dart';
import 'controllers/firestore_controller.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: Configuration.apiKey,
        authDomain: Configuration.authDomain,
        databaseURL: Configuration.databaseURL,
        projectId: Configuration.projectId,
        storageBucket: Configuration.storageBucket,
        messagingSenderId: Configuration.messagingSenderId,
        appId: Configuration.appId,
        measurementId: Configuration.measurementId),
  );

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: FutureBuilder(
                future: _init,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Wrong();
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    // crear los controladores
                    Get.put(FirestoreController());
                    Get.put(ChatController());
                    Get.put(AuthenticationController());
                    return const FirebaseCentral();
                  }

                  return const Loading();
                })));
  }
}

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Error"));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Loading"));
  }
}
