import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> todos = [
    ['Learn Web Development', false],
    ['Learn Flutter', false],
    ['Learn Dart', false],
  ];

  void toggleTodoStatus(int index) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void addTodo() {
    setState(() {
      todos.add(['New Task', false]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: const Text('My To-Do List'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: todo[1] ? Colors.greenAccent.shade100 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: ListTile(
                leading: Checkbox(
                  value: todo[1],
                  activeColor: Colors.deepPurple,
                  onChanged: (value) => toggleTodoStatus(index),
                ),
                title: Text(
                  todo[0],
                  style: TextStyle(
                    decoration: todo[1] ? TextDecoration.lineThrough : null,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
