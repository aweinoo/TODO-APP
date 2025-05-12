import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:to_do_app/cards_view.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/add_task.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ignore: use_super_parameters
  const CustomAppBar({Key? key}) : super(key: key);

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
  final List<Task> tasks;
  final Function(int) onCompletedToggle;
  const HomePage({
    Key? key,
    required this.tasks,
    required this.onCompletedToggle,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: _TaskCardList(
                tasks: widget.tasks,
                onCompletedToggle: widget.onCompletedToggle,
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}

class _TaskCardList extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onCompletedToggle;

  const _TaskCardList({
    Key? key,
    required this.tasks,
    required this.onCompletedToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(task.description, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 8),
                Text(
                  'Deadline: ${DateFormat('yyyy-MM-dd HH:mm').format(task.dateTime)}',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // Implement edit functionality
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Implement delete functionality
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        onCompletedToggle(index);
                      },
                      icon: const Icon(Icons.check_box_outline_blank),
                      label: const Text('Mark as Complete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
