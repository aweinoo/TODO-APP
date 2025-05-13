import 'package:flutter/material.dart';
import 'package:to_do_app/home.dart';
import 'package:to_do_app/add_task.dart';
import 'package:to_do_app/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<BottomNavBar> {
  int index = 0;
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Load tasks when the app starts
  }

  // Load tasks from SharedPreferences
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString('tasks');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      setState(() {
        tasks = jsonList.map((json) => Task.fromJson(json)).toList();
      });
    }
  }

  // Save tasks to SharedPreferences
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(
      tasks.map((task) => task.toJson()).toList(),
    );
    await prefs.setString('tasks', jsonString);
  }

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
      _saveTasks();
    });
  }

  void _updateTask(int index, Task updatedTask) {
    setState(() {
      tasks[index] = updatedTask;
      _saveTasks();
    });
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _saveTasks();
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
      _saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: index,
          children: [
            HomePage(
              tasks: tasks,
              onAddTask: _addTask,
              onUpdateTask: _updateTask,
              onDeleteTask: _deleteTask,
              onToggleTaskCompletion: _toggleTaskCompletion,
              isCompletedList: [],
              onCompletedToggle: (int) {},
            ),
            AddTaskPage(onAddTask: _addTask),
            TaskPage(
              tasks: tasks,
              onUpdateTask: _updateTask,
              onDeleteTask: _deleteTask,
              onToggleTaskCompletion: _toggleTaskCompletion,
              isCompletedList: [],
              onCompletedToggle: (int) {},
            ),
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
