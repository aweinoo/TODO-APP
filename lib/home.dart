// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:to_do_app/bottomnavbar.dart';
import 'package:to_do_app/cards_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFf5f5f5),
      elevation: 0,
      leading: Container(
        padding: const EdgeInsets.only(top: 4),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: Colors.deepPurple.shade100,
            child: Text(
              'B',
              style: TextStyle(
                color: Colors.deepPurple.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search_rounded),
          tooltip: 'Search for the task',
          onPressed: () {
            print('Search Button was pressed');
          },
        ),
        const SizedBox(width: 16.0),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            print('Notification Button was pressed');
          },
        ),
        const SizedBox(width: 0.0),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  final List<bool> isCompletedList;
  final Function(int) onCompletedToggle;
  const HomePage({
    super.key,
    required this.isCompletedList,
    required this.onCompletedToggle,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isCompletedList = List.generate(5, (index) => false);

  // ✅ add onCompletedToggle here
  void onCompletedToggle(int index) {
    setState(() {
      isCompletedList[index] = !isCompletedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: const Color(0xFFf5f5f5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            const Padding(
              padding: EdgeInsets.only(top: 12.0, left: 28),
              child: Text(
                'Hello Blossom 👋',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 28.0),
              child: Text(
                "Let's get started keeping your tasks organized ",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 34),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CardsView(
                isCompletedList: isCompletedList,
                onCompletedToggle: onCompletedToggle,
                onDelete: (index) {
                  setState(() {
                    isCompletedList.removeAt(index);
                  });
                },

                // ✅ pass callback
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
