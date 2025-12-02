import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_trainee_module/module2_oops_concepts/oops_concepts.dart';
import 'package:flutter_trainee_module/module3_asynchronous_programming/asynchronous_programming.dart';
import 'package:flutter_trainee_module/module5_advanced_dart_features/isolates.dart';

void main() {
  Child c = Child("vinod", 5, "indore");
  String str = c.saySomething();

  UserServices services = UserServices();

  TodoServices pServices = TodoServices();

  List<Map<String, dynamic>> users = services.fetchUsers();

  runZonedGuarded(
    () {
      FlutterError.onError = (FlutterErrorDetails details) {
        print("Flutter Error: ${details.exception}");
        print("Stack: ${details.stack}");
      };

      runApp(
        MaterialApp(
          home: Padding(
            padding: const EdgeInsets.only(top: 0.8),
            child: Scaffold(
              appBar: AppBar(
                title: Text("Flutter trainee module"),
                backgroundColor: const Color.fromARGB(255, 63, 61, 60),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              ),
              body: Center(child: Isolates()),
            ),
          ),
        ),
      );
    },
    (error, stack) {
      // Print all async/global errors
      print("Global Error: $error");
      print("Stack: $stack");
    },
  );
}
