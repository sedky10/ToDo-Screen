import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

void main() => runApp(const ToDo());

class ToDo extends StatelessWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoTask(),
    );
  }
}

class TodoTask extends StatefulWidget {
  const TodoTask({Key? key}) : super(key: key);

  @override
  State<TodoTask> createState() => _TodoTaskState();
}

class _TodoTaskState extends State<TodoTask> {
  List<Todo> task = [
    Todo('Quiz', '1.25 PM'),
    Todo('GYM', '5.00 PM'),
    Todo('Report', '3.00 PM'),
    Todo('Swimming', '7.30 PM'),
    Todo('Work', '7.00 AM'),
    Todo('Dinner', '1.00 PM'),
    Todo('Flutter Task', '9.00 PM'),
    Todo('Quiz', '1.25 PM'),
    Todo('GYM', '5.00 PM'),
    Todo('Report', '3.00 PM'),
    Todo('Swimming', '7.30 PM'),
    Todo('Work', '7.00 AM'),
    Todo('Dinner', '1.00 PM'),
    Todo('Flutter Task', '9.00 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Color(0xff4368FF),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff4368FF),
        elevation: 0,
        title: const Center(
          child: Text(
            'Todo App',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xff4368FF),
          child: ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  task[index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                subtitle: Text(
                  task[index].time,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: MaterialButton(
                  onPressed: () {
                    showDialog(
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Center(
                              child: Text(
                            'Deleting',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.delete,
                                  size: 100,
                                  color: Color(0xff4368FF),
                                ),
                                Text(
                                  'Are You Sure You Want To Delete This Task?',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Color(0xff4368FF),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            MaterialButton(
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  task.removeAt(index);
                                });
                              },
                            ),
                          ],
                        );
                      },
                      context: context,
                    );
                  },
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
