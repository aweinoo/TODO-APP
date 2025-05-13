import 'package:flutter/material.dart';
import 'package:to_do_app/cards_view.dart';
import 'package:to_do_app/add_task.dart'; // Import Task class

class TaskPage extends StatefulWidget {
  final List<Task> tasks; // Change to List<Task>
  final Function(Task) onAddTask;
  final Function(int, Task) onUpdateTask;
  final Function(int) onDeleteTask;
  final Function(int) onToggleTaskCompletion;

  const TaskPage({
    super.key,
    required this.tasks,
    required this.onAddTask,
    required this.onUpdateTask,
    required this.onDeleteTask,
    required this.onToggleTaskCompletion,
    required List<bool> isCompletedList,
    required void Function(int index) onCompletedToggle,
  });

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
                indicatorWeight: 2,
                indicatorColor: Color.fromARGB(255, 249, 182, 78),
                labelColor: Color(0xFFF9B64E),
                unselectedLabelColor: Colors.black,
                labelPadding: EdgeInsets.only(top: 16),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  AllTaskPage(
                    tasks: widget.tasks, // Pass tasks
                    onToggleTaskCompletion:
                        widget.onToggleTaskCompletion, // Pass callback
                  ),
                  PendingTaskPage(
                    tasks: widget.tasks, // Pass tasks
                    onToggleTaskCompletion:
                        widget.onToggleTaskCompletion, // Pass callback
                  ),
                  CompletedTaskPage(
                    tasks: widget.tasks, // Pass tasks
                    onToggleTaskCompletion:
                        widget.onToggleTaskCompletion, // Pass callback
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

// ✅ Pass shared state & toggle function to child pages

class AllTaskPage extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggleTaskCompletion;

  const AllTaskPage({
    super.key,
    required this.tasks,
    required this.onToggleTaskCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: CardsView(
        tasks: tasks, // Use tasks directly
        onToggleTaskCompletion: onToggleTaskCompletion,
        showOnlyPending: false,
        showOnlyCompleted: false,
        onDelete: (index) {},
      ),
    );
  }
}

class PendingTaskPage extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggleTaskCompletion;

  const PendingTaskPage({
    super.key,
    required this.tasks,
    required this.onToggleTaskCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: CardsView(
        tasks: tasks, // Use tasks directly
        onToggleTaskCompletion: onToggleTaskCompletion,
        showOnlyPending: true,
        showOnlyCompleted: false,
        onDelete: (index) {},
      ),
    );
  }
}

class CompletedTaskPage extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) onToggleTaskCompletion;

  const CompletedTaskPage({
    super.key,
    required this.tasks,
    required this.onToggleTaskCompletion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: CardsView(
        tasks: tasks, // Use tasks directly
        onToggleTaskCompletion: onToggleTaskCompletion,
        showOnlyPending: false,
        showOnlyCompleted: true,
        onDelete: (index) {},
      ),
    );
  }
}
