// Dart collection includes Lists, Sets and Maps classes. 

// Lists : 
// Lists are like arrays in dart that stores similar datatype values or dynamic type values. Lists can be of fixed length or can be strechable. 


class ListExamples {

// Growable list of strings
List<String> list = ["string1", "string2", "string3", "string2"];
// Growable list of dynamic data types.
List<dynamic> listWithMixedTypes = ["string", 2, true];
// Fixed length List.
List<int> listWithFixedLength = List.filled(3, 0);

// Adding values to the list 
void addingValueToTheList (){
  // adding single values
  listWithMixedTypes.add(23);
  // adding multiple values 
  list.addAll(["String4", "string5"]);
  // inserting at a certain index 
  list.insert(2, "element inserted at index 2");
}

void removeValuesFromTheList (){
  // remove by first match 
  list.remove("element inserted at index 2");
  // remove element at certain index
  list.removeAt(2);
  // remove last element of the list
  list.removeLast();
  // remove where a condition is met 
  list.removeWhere((element){return element == "string1";});
}

void findValuesInLists (){
  // find the index of the value 
  list.indexOf("string2");
  // find the last index of the element 
  list.lastIndexOf("string2");
  // find the index of element where condition is met first.
  list.indexWhere((element){
    return element.startsWith("string");
  });

  // finding if list contains a value or not 
  list.contains("string4"); // returns true if string4 is in list else returns false.

}

void operations() {
  // map method iterate over the iterables like list and returns a new modified list. 
  // Can be used to render a list by returning a widget.
  list.map((item){
    return "$item added string";
  });

  // reduce method returns a single value by iterating over the list. (cannot be used on empty list)
  list.reduce((a, b)=> a + b);
  // fold method also returns a single value but it allows to initialise the start value so that it can be used on empty lists.
  list.fold("", (a, b) => a+b);
  // shuffles the list randomly.
  list.shuffle();

  // where method is alternative to filter method in javascript, it returns a new iterable.
  list.where((item)=> item.startsWith("s")).toList();

  // for each is a method that iterates over each element of the list in order.
  list.forEach((item)=> print(item)); 
}



void printList (){
  // addingValueToTheList();
  // removeValuesFromTheList();
  print([list[2]]);

  // spread operator : spread operator in dart allows to insert the elements of iterables with the ... operator.
  print([...list, ...listWithMixedTypes]);
}

}


// Maps are the key value pairs in dart that is similar to object in js.

class MapExamples {

  // map is a generic class that accepts types of key and the values. 
  Map<String, String> stringMap = {
    "name" : "suresh",
    "city" : "indore", 
    "role" : "developer"
  };

  // dynamic value map : 
  Map<String, dynamic> dynamicMap = {
    "name" : "harshit", 
    "age" : 22, 
    "isDev": true
  };


  void printMaps (){
    // get all the keys : 
    print(dynamicMap.keys); // return all the keys in the map
    // get all the values : 
    print(dynamicMap.values); // returns all the values in the map
    // access the values with keys : 
    print(dynamicMap["name"]);
    // check if a map contains the key or not : 
    print(dynamicMap.containsKey("name")); // returns a true of false
    // check if a map contains a value or not : 
    print(dynamicMap.containsValue("harshit")); // returns true or false
    // remove key from map : 
    print(dynamicMap.remove("age")); // returns the value removed
    // clear the whole map
    //dynamicMap.clear() // clears the whole array.

    // update a value in the map : 
    dynamicMap.update("name", (value){ return "Harshit vishwakarma";});

    // loop through the map : 
    dynamicMap.forEach((key, value){
      print('$key : $value');
    });

  // return a new map with modified values or keys based on provided callback function. 
    dynamicMap.map((key, value){
      return MapEntry(key, value.toString().toUpperCase());
    });
  }
}


// Sets in dart is a list with only unique values, 

class SetExamples {

  Set<String> set = {"harshit", "sudhanshu", "elon"};
  Set<String> set2 = {"harshit", "musk", "sudhesh"};

  void methodsOfSets (){
    // to add any value in set : 
    set.add("newString");
    // to add multiple values in set : 
    set.addAll(["musk", "josh"]);
    // remove element from set : 
    set.remove("musk");
    // remove the element where the condition mets : 
    set.removeWhere((item){
      return item.startsWith("s");
    });
    // union two sets :  
    print(set.union(set2)); // returns a new set with all the unique values in the both the sets.
    // intersect two sets : 
    print(set.intersection(set2)); // returns a new set with all the elements common in both the sets.
    // differences : 
    print(set.difference(set2)); // returns a new set of the differences in the two sets.

    // iterate through the set : 
    for (var item in set) {
      print(item);
    }

    // convert set to a list : 
    List<String> list = set.toList();
    print(list);

  }
}




void main(){
  // ListExamples listClassController =  ListExamples();
  // listClassController.printList();
}