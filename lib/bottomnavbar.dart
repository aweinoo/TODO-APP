import 'package:flutter/material.dart';
import 'package:to_do_app/home.dart';
import 'package:to_do_app/add_task.dart'; //Removed Unused Import
import 'package:to_do_app/task.dart'; //Removed Unused Import

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<BottomNavBar> {
  int index = 0;
  List<bool> isCompletedList = List.generate(5, (_) => false);

  void onCompletedToggle(int i) {
    setState(() {
      isCompletedList[i] = !isCompletedList[i];
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
              isCompletedList: isCompletedList,
              onCompletedToggle: onCompletedToggle,
            ),
            AddTaskPage(), // Use the placeholder
            TaskPage(
              isCompletedList: isCompletedList,
              onCompletedToggle: onCompletedToggle,
            ),
          ],
        ),
      ), // Added body
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
                  MaterialPageRoute(builder: (context) => AddTaskPage()),
                );
              },
              child: Icon(Icons.add_circle_outline),
            ),
            label: "Add task",
            // icon: Icon(Icons.add_circle_outline),
            // label: "Add task",
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
