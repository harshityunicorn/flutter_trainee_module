void main() {
  double result = addWithPositionalArgument(23, 22.6);
  double result2 = addWithNamedArguments(num1: 23, num2: 42.2);
  print(result);
  print(result2);
  bool isprime = isPrime(13);
  print(isprime);
  print(
    "multiplication of ${[2, 4, 1]} ${switchExampleCalculator("/", [2, 4, 2])} ",
  );

  var user = {"name": "Harshit", "age": 22, "country": "India"};

  user.forEach((key, value) {
    print("$key : $value");
  });

  for (var element in user.keys) {
    print(element);
  }


  var values = [2, 4, 2, 4, 5, 6];

  var set = new Set();
  set.addAll(values);
  print(set);

  var newUser = new Person(name: "vinod", age: 21, city: "indore");

  

  print(newUser.getUserInfo());

  List<Product> list = [
    Product(title: "laptop", price: 50000, id: "234"),
    Product(title: "mouse", price: 50000, id: "235"),
    Product(title: "keyboard", price: 50000, id: "236"),
    Product(title: "speaker", price: 50000, id: "237"),
  ];


  list.forEach((item){
    print(item.title);
  });

  Map<String, dynamic> user1 =  Map();

  user1["username"] = "harshit";

  List <Map<String, dynamic>> list2 = List.filled(10, user1);
  // list2.addAll(List.filled(10, true));
  

  print(list2[0]["username"]);




}

// Functions

bool isPrime(a) {
  for (int i = 2; i <= a / 2; i++) {
    if (a % i == 0) {
      return false;
    }
  }
  return true;
}

addWithPositionalArgument(num a, num b) {
  return a + b;
}

addWithNamedArguments({num1, num2}) {
  return num1 + num2;
}

switchExampleCalculator(op, List<num> a) {
  if (a.isEmpty) {
    throw ArgumentError("Argument cannot be empty");
  }

  switch (op) {
    case '*':
      return a.reduce((a, b) => a * b);
    case '-':
      return a.reduce((a, b) => a * b);
    case '+':
      return a.reduce((a, b) => a * b);
    case '/':
      return a.reduce((a, b) => b==0 ? 0 : a / b);
    default:
      throw ArgumentError("unknown operation");
  }
}

class Person {
  String _name;
  int _age;
  String _city;
  Person({required name, required age, required city})
    : _name = name,
      _age = age,
      _city = city;

  String get city => _city;

  Object getUserInfo() {
    return {"name": this._name, "age": this._age, "city": this._city};
  }
}


class Product {
  String? title;
  double? price;
  String? id;
  Product({required this.title, required this.price, required this.id});
}
