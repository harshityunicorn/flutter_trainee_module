// Generics : Generics are the strongly data typed data models that accepts the datatype in <>.

// declaring a generic class :
class GenericExample<T> {
  T variable;
  GenericExample(this.variable);
  // generic methods will return the value of the type T.
  T genericMethod() {
    return variable;
  }

  // List, Sets, Maps and Queues are also generic type collections that accepts the type.
  // list of type T :
  List<T> listOfTypeT = [];
}

// restricting the type of the object using generic types :

class Model {}

class RestrictedType<T extends Model> {
  T data;
  RestrictedType(this.data);
}

class User extends Model {}

// Generic mixins :
mixin logger<T> {
  void log(T data) {
    print(data);
  }
}

class UserLogger with logger<User> {}

// Extensions allow to add the methods to the class and types without modifying the actual class or types.

extension PrintHello on String {
  void printHello() {
    print("hello");
  }

  bool isMail() {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    print(this);
    return emailRegex.hasMatch(this);
  }
}

extension on List {
  void printList() {
    print(this);
  }
}

// Enums are the fixed set of constant values declared to avoid typos, used for app states, user roles, tags etc.

enum Status { loading, success, error }

// Sealed classes :
// sealed classes are restricted classes that can only be used inside the file it is declared in, also it
// cannot be initialized. sealed classes are used to represents states but with more features as storing variables and methods unlike enums.

sealed class TodoState {}

class TodoLoading extends TodoState {}

class TodoSuccess extends TodoState {
  final String todo;
  TodoSuccess(this.todo);
}

class TodoError extends TodoState {
  final String error;
  TodoError(this.error);
}

void main() {
  GenericExample<String> obj = GenericExample("hii");
  // only User typed data can be pased to this constructor function.
  var user = RestrictedType<User>(User());

  // using extension method :
  "".printHello();
  print("harshit@gmail.com".isMail());

  ["this list will", "be printed"].printList();

  // enum use case :
  var status = Status.success;

  if (status == Status.success) {
    status = Status.loading;
    print("success");
  }

  // enums can be used with switch case statements, you will get the warning if all the cases of enums are not handled.

  switch (status) {
    case Status.loading:
      print("loading now...");
    case Status.success:
      print('success');
    case Status.error:
      print("something went wrong");
  }

  TodoState state = TodoLoading();

  switch (state) {
    case TodoLoading():
      print("loading");
    case TodoSuccess():
      // TODO: Handle this case.
      print("success");
    case TodoError():
      // TODO: Handle this case.
      print("error");
  }
}
