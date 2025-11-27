import 'package:flutter/material.dart';
import 'package:flutter_trainee_module/module2_oops_concepts/oops_concepts.dart';

void main() {
  Child c = Child("vinod", 5, "indore");
  String str = c.saySomething();

  UserServices services = UserServices();

  List<Map<String, dynamic>> users = services.fetchUsers();

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
          body: Center(
            child: CardLayout(
              child: Column(
                children: [
                  ...users.map(
                    (item) => Text(
                      "${item["name"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
