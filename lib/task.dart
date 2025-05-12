import 'package:flutter/material.dart';
// import 'package:to_do_app/cards_view.dart';
import 'package:to_do_app/add_task.dart'; // Import Task
import 'package:intl/intl.dart';

class TaskPage extends StatefulWidget {
  final List<Task> tasks;
  final Function(int) onCompletedToggle;
  const TaskPage({
    Key? key,
    required this.tasks,
    required this.onCompletedToggle,
  }) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: 450,
              child: TabBar(
                controller: _tabController,
                onTap: (value) {
                  setState(() {
                    _tabController.index = value;
                  });
                },
                tabs: const [
                  Tab(text: "All tasks"),
                  Tab(text: "Pending"),
                  Tab(text: "Completed"),
                ],
                indicatorColor: const Color(0xFFF9B64E),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _AllTaskPage(
                    tasks: widget.tasks,
                    onCompletedToggle: widget.onCompletedToggle,
                  ),
                  _PendingTaskPage(
                    tasks: widget.tasks,
                    onCompletedToggle: widget.onCompletedToggle,
                  ),
                  _CompletedTaskPage(
                    tasks: widget.tasks,
                    onCompletedToggle: widget.onCompletedToggle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AllTaskPage extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onCompletedToggle;

  const _AllTaskPage({
    Key? key,
    required this.tasks,
    required this.onCompletedToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: ListView.builder(
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
      ),
    );
  }
}

class _PendingTaskPage extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onCompletedToggle;

  const _PendingTaskPage({
    Key? key,
    required this.tasks,
    required this.onCompletedToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pendingTasks =
        tasks
            .where((task) => false)
            .toList(); // Modify this based on your completion logic
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: ListView.builder(
        itemCount: pendingTasks.length,
        itemBuilder: (context, index) {
          final task = pendingTasks[index];
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
      ),
    );
  }
}

class _CompletedTaskPage extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onCompletedToggle;

  const _CompletedTaskPage({
    Key? key,
    required this.tasks,
    required this.onCompletedToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final completedTasks =
        tasks
            .where((task) => true)
            .toList(); // Modify this based on your completion logic
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          final task = completedTasks[index];
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
      ),
    );
  }
}
