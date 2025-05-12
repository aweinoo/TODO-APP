import 'package:flutter/material.dart';
import 'package:to_do_app/home.dart';
import 'package:to_do_app/add_task.dart';
import 'package:to_do_app/task.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<BottomNavBar> {
  int index = 0;
  List<Task> tasks = []; // Store Task objects

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void onCompletedToggle(int taskIndex) {
    setState(() {
      // Access the correct Task object using the index
      // No need to store booleans separately anymore
      // tasks[taskIndex].isCompleted = !tasks[taskIndex].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: index,
          children: [
            HomePage(tasks: tasks, onCompletedToggle: onCompletedToggle),
            AddTaskPage(onAddTask: _addTask),
            TaskPage(tasks: tasks, onCompletedToggle: onCompletedToggle),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          if (mounted) {
            setState(() {
              index = value;
            });
          }
        },
        elevation: 0,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTaskPage(onAddTask: _addTask),
                  ),
                );
              },
              child: Icon(Icons.add_circle_outline),
            ),
            label: "Add task",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.check), label: "Task"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFf5f5f5),
        selectedItemColor: Color.fromARGB(255, 249, 182, 78),
      ),
    );
  }
}
