import 'package:flutter/material.dart';

// class is a blueprint of the object that defines the data structure of the object by declaring variables and methods inside the class
// classes that defines the data model of an entity are also known as data models.
// classes that returns UI components (Widgets) are called custom widgets.

class Person {
  String name;
  int age;
  String? city;

  // Class constructor is used to initialize the object of that class, defining the values to be provided
  // while creating the object.

  // parameterized constructor :
  Person(this.name, this.age, this.city);

  // named constructor are those constructor that are used with a different name from the class name
  Person.fromCity(this.city) : name = "Unknown", age = 0;
  Person.fromJson(Map<String, dynamic> person)
    : name = person['name'],
      age = person['age'];
  Person.changeCity(Person p, String newcity)
    : name = p.name,
      age = p.age,
      city = newcity;

  // getters and setters :

  String get getUserName {
    return name;
  }

  set setUserName(String newName) {
    name = newName;
  }

  // methods :

  String saySomething() {
    return "hello from the parent class";
  }
}

// creating an object of the class person using generative constructor :
Person p = Person("Harshit", 22, "indore");

// creating an object of the class Person using named constructor :
Person p2 = Person.fromCity("Indore");

// changing the city name with the names constructor of p1 :
Person p3 = Person.changeCity(p, "rau");

// inheritence is the property in OOP where a class can inherit properties of other class using the keyword extends
// the objects created from the child class can also access the methods inherited from the parent classes.
// the child class can override the methods
class Child extends Person {
  Child(super.name, super.age, super.city);
  @override
  String saySomething() {
    return "hello from the child class";
  }
}

// creating a widget using classes :
// a widget class is required to inherit from the Widget class (that can be statefull or stateless) and return a widget.

class StyledText extends StatelessWidget {
  const StyledText({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      "this is a widget",
      style: TextStyle(
        color: Colors.yellowAccent[700],
        fontFamily: 'sant-sarif',
      ),
    );
  }
}

// re-usable widget bases are the widgets that act as layouts around other widget and can be reused.

class CardLayout extends StatelessWidget {
  final Widget child;
  const CardLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.black,
      ),
      child: child,
    );
  }
}

// service classes are the classes that are mean to serve things like data fetching, utility classes etc.

class UserServices {
  List<Map<String, dynamic>> fetchUsers() {
    return [
      {"name": "harshit", "age": "22"},
      {"name": "vinod", "age": "12"},
      {"name": "suresh", "age": "32"},
    ];
  }
}

// mixins are the classes like things uses to achieve multiple inheritence

mixin Logger {
  void log(String lg) {
    print("[LOG] $lg");
  }
}

mixin MailValidator {
  bool validateMail(String mail) {
    return mail.contains('@') && mail.contains('.');
  }
}

class EmailInputValidator extends StatelessWidget with MailValidator, Logger {
  const EmailInputValidator({super.key});
  @override
  Widget build(BuildContext context) {
    log("Email input widget");
    String email = "harshit@gmail.com";
    bool isEmail = validateMail(email);
    return Text(isEmail ? "valid mail" : "invalid mail");
  }
}

