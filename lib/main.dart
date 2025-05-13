import 'package:flutter/material.dart';
import 'package:to_do_app/add_task.dart';
import 'package:to_do_app/bottomnavbar.dart';
import 'package:to_do_app/cards_view.dart';
import 'package:to_do_app/createnewacc.dart';
import 'package:to_do_app/forgotpasswordpage.dart';
import 'package:to_do_app/getstarted.dart';
import 'package:to_do_app/home.dart';
import 'package:to_do_app/loginpage.dart';
import 'package:to_do_app/newpassword.dart';
import 'package:to_do_app/profile.dart';
import 'package:to_do_app/registerpage.dart';
import 'package:to_do_app/searchtask.dart';
import 'package:to_do_app/task.dart';
import 'package:to_do_app/verifycode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateAccountPage(),
      debugShowCheckedModeBanner: false,
      title: 'To Do App', //Added title
      routes: {
        '/homepage':
            (context) => HomePage(
              tasks: [],
              onAddTask: (Task task) {},
              onUpdateTask: (int index, Task updatedTask) {},
              onDeleteTask: (int index) {},
              onToggleTaskCompletion: (int index) {},
              isCompletedList: [],
              onCompletedToggle: (int index) {},
            ),
        '/addtask': (context) => AddTaskPage(onAddTask: (task) {}),
        '/cardsview':
            (context) => CardsView(
              showOnlyPending: false,
              showOnlyCompleted: false,
              onDelete: (dynamic index) {},
              tasks: [],
            ),
        '/bottomnavbar':
            (context) => BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add Task',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
              ],
              currentIndex: 0,
              onTap: (index) {
                // Handle navigation
              },
            ),
        '/taskpage':
            (context) => TaskPage(
              tasks: [],
              onAddTask: (Task task) {},
              onUpdateTask: (int index, Task updatedTask) {},
              onDeleteTask: (int index) {},
              onToggleTaskCompletion: (int index) {},
              isCompletedList: [],
              onCompletedToggle: (int index) {},
            ),
        '/forgotpassword': (context) => ForgotPasswordPage(),
        '/loginpage': (context) => LoginPage(),
        '/createaccountpage': (context) => CreateAccountPage(),
        '/registerpage': (context) => RegisterPage(),
        '/profilepage': (context) => ProfilePage(),
        '/newpasswordpage': (context) => NewPasswordPage(),
        '/getstartedpage': (context) => GetStartedPage(),
        'verifycodepage': (context) => VerifyCodePage(),
        '/searchtaskpage': (context) => SearchTaskPage(),
      },
    );
  }
}
