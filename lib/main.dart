import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> tasklist = [];
  TextEditingController taskinput = TextEditingController();

  void createtask() {
    setState(() {
      tasklist.add({'task': taskinput.text, 'completed': false});
      taskinput.clear();
    });
  }

  void deletetask(int index) {
    setState(() {
      tasklist.removeAt(index);
    });
  }

  void completedtask(int index) {
    setState(() {
      tasklist[index]['completed'] = !tasklist[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Text('Task Manager'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: taskinput,
              decoration: InputDecoration(hintText: 'Enter task'),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: createtask, child: Text('Add')),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                  itemCount: tasklist.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Checkbox(
                          value: tasklist[index]['completed'],
                          onChanged: (_) => completedtask(index),
                        ),
                        Expanded(
                          child: Text(tasklist[index]['task']),
                        ),
                        TextButton(
                          onPressed: () => deletetask(index),
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
