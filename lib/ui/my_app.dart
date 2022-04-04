import 'package:f_firebase_202210/ui/firebase_cental.dart';
import 'package:f_firebase_202210/ui/pages/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();

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
    return Container(
      child: Center(child: Text("Error")),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Loading")),
    );
  }
}
