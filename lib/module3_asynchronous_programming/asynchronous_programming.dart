import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future is the widget that allows to run the asynchronous tasks in the code that might give response after some delay.

// async await are the key words used with the asynchronous code to hold the code after the await till the awaited process is excecuted completely.
// to use the await keyword we need to declare function as async, that automatically marks that the function will return a Future(Promise).

class TodoServices {
  Future<Map<String, dynamic>> fetchTodo() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
      );
      var responseData = await json.decode(response.body);
      return responseData;
    } catch (error) {
      throw Exception("failed to fetch data");
    }
  }
}

// Using the service class and Future Builder

class TodoList extends StatelessWidget {
  TodoList({super.key});

  final TodoServices td = TodoServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: td.fetchTodo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong! : ${snapshot.error}"),
          );
        }

        var data = snapshot.data;
        return Center(
          child: Text(
            "${data?["title"]}",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

// Using the service class and init state.

class UsingStateTodoList extends StatefulWidget {
  const UsingStateTodoList({super.key});

  @override
  UsingState createState() => UsingState();
}

class UsingState extends State<UsingStateTodoList> {
  final TodoServices td = TodoServices();
  dynamic todoData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final result = await td.fetchTodo();
      setState(() {
        todoData = result;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Center(
      child: Column(
        children: [
          Text(
            "data is fetched and the title is : ${todoData["title"]}",
            style: TextStyle(color: Colors.white),
          ),
          StreamCountDown(),
        ],
      ),
    );
  }
}

// Streams are the List of asynchronous tasks excecuted one by one.
// this can be used to process big chunks of data like storing images or files.

class StreamCountDown extends StatefulWidget {
  const StreamCountDown({super.key});

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<StreamCountDown> {
  // StreamController is a constructor that provides methods to controll the stream.
  final StreamController _controller = StreamController();
  int counter = 0;

  void count() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      counter++;
      // adding counter's data in the stream.
      _controller.sink.add(counter);

      if (counter >= 10) {
        counter = 0;
      }
    });
  }

  // initializing the state.
  @override
  void initState() {
    super.initState();
    count();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  // using stream builder to display the stream data.

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: counter.toString(),
      stream: _controller.stream,
      builder: (context, snapshot) {
        return Text(
          snapshot.data.toString(),
          style: TextStyle(color: Colors.white),
        );
      },
    );
  }
}

// Streams generally have 2 types, single stream and broadcaster stream.
// single stream can only have one subscriber and do not emit events when there is no listeners.
// broadcaster stream has multiple subscribers.

// single stream example :

StreamController<String> controller = StreamController<String>();
Stream<String> stream = controller.stream;

StreamSubscription singleStream() {
  StreamSubscription<String> subscriber = stream.listen(
    (String data) {
      print(data);
    },
    onError: (er) {
      print(er);
    },
    onDone: () {
      print('stream is closed');
    },
  );

  return subscriber;
}

// broadcaster stream example :

StreamController<String> controller2 = StreamController<String>();
Stream<String> stream2 = controller2.stream.asBroadcastStream();

List<StreamSubscription> broadCasterStream() {
  StreamSubscription subriber1 = stream2.listen(
    (data) {
      print(data);
    },
    onError: (error) {
      print(error);
    },
    onDone: () {
      print("done");
    },
  );
  StreamSubscription subriber2 = stream2.listen(
    (data) {
      print(data);
    },
    onError: (error) {
      print(error);
    },
    onDone: () {
      print("done");
    },
  );
  StreamSubscription subriber3 = stream2.listen(
    (data) {
      print(data);
    },
    onError: (error) {
      print(error);
    },
    onDone: () {
      print("done");
    },
  );

  return [subriber1, subriber2, subriber3];
}
