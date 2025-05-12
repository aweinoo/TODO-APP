import 'package:flutter/material.dart';
import 'package:to_do_app/cards_view.dart';

class TaskPage extends StatefulWidget {
  final List<bool> isCompletedList;
  final Function(int) onCompletedToggle;
  const TaskPage({
    super.key,
    required this.isCompletedList,
    required this.onCompletedToggle,
  });

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // 🔥 Move shared state here
  List<bool> isCompletedList = List.generate(5, (index) => false);

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
                    isCompletedList: isCompletedList,
                    onCompletedToggle: (index) {
                      setState(() {
                        isCompletedList[index] = !isCompletedList[index];
                      });
                    },
                  ),
                  PendingTaskPage(
                    isCompletedList: isCompletedList,
                    onCompletedToggle: (index) {
                      setState(() {
                        isCompletedList[index] = !isCompletedList[index];
                      });
                    },
                  ),
                  CompletedTaskPage(
                    isCompletedList: isCompletedList,
                    onCompletedToggle: (index) {
                      setState(() {
                        isCompletedList[index] = !isCompletedList[index];
                      });
                    },
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
  final List<bool> isCompletedList;
  final Function(int) onCompletedToggle;

  const AllTaskPage({
    super.key,
    required this.isCompletedList,
    required this.onCompletedToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: CardsView(
        isCompletedList: isCompletedList,
        onCompletedToggle: onCompletedToggle,
        onDelete: (index) {},
      ),
    );
  }
}

class PendingTaskPage extends StatelessWidget {
  final List<bool> isCompletedList;
  final Function(int) onCompletedToggle;

  const PendingTaskPage({
    super.key,
    required this.isCompletedList,
    required this.onCompletedToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: CardsView(
        isCompletedList: isCompletedList,
        onCompletedToggle: onCompletedToggle,
        showOnlyPending: true,
        onDelete: (index) {},
      ),
    );
  }
}

class CompletedTaskPage extends StatelessWidget {
  final List<bool> isCompletedList;
  final Function(int) onCompletedToggle;

  const CompletedTaskPage({
    super.key,
    required this.isCompletedList,
    required this.onCompletedToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
      child: CardsView(
        isCompletedList: isCompletedList,
        onCompletedToggle: onCompletedToggle,
        showOnlyCompleted: true,
        onDelete: (index) {},
      ),
    );
  }
}
