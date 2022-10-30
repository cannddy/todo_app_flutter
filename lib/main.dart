import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
      themeMode: ThemeMode.dark,
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.red),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void call() {
    print("Be ready");
  }

  //comment type name=value;
  List<String> todos = [];
  TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        // actions: [
        //   IconButton(
        //     onPressed: call,
        //     icon: Icon(Icons.add),
        //   )
        // ],
      ),

      // body: ListView.builder(
      //   itemCount: todos.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(todos[index]),
      //     );
      //   },
      // ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  leading: Text((index + 1).toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        todos.remove(todos[index]);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter a Todo"),
                    controller: todoController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (todoController.text.isNotEmpty) {
                      setState(() {
                        todos.add(todoController.text);
                      });
                      todoController.clear();
                    }
                  },
                  child: Text("Add"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
