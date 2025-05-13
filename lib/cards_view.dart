import 'package:flutter/material.dart';
import 'package:to_do_app/add_task.dart';

// ... imports

class CardsView extends StatefulWidget {
  final List<Task> tasks;
  final bool showOnlyPending;
  final bool showOnlyCompleted;
  final Function(int)? onToggleTaskCompletion;
  final Function(int)? onDelete;

  const CardsView({
    super.key,
    required this.tasks,
    this.showOnlyPending = false,
    this.showOnlyCompleted = false,
    this.onToggleTaskCompletion,
    this.onDelete,
  });

  @override
  _CardsViewState createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> with TickerProviderStateMixin {
  late List<int> displayIndexes;
  late List<bool> isEditMenuVisible;
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _filterTasks();
    isEditMenuVisible = List.generate(widget.tasks.length, (_) => false);

    _controllers = List.generate(
      widget.tasks.length,
      (_) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      ),
    );

    _slideAnimations =
        _controllers
            .map(
              (controller) => Tween<Offset>(
                begin: Offset(1, 0),
                end: Offset(0, 0),
              ).animate(
                CurvedAnimation(parent: controller, curve: Curves.easeInOut),
              ),
            )
            .toList();
  }

  @override
  void didUpdateWidget(covariant CardsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tasks != widget.tasks) {
      setState(() {
        _filterTasks();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void toggleEditMenu(int index) {
    if (_controllers[index].isCompleted) {
      _controllers[index].reverse();
    } else {
      _controllers[index].forward();
    }
  }

  void _filterTasks() {
    if (widget.showOnlyPending) {
      displayIndexes =
          List.generate(
            widget.tasks.length,
            (i) => i,
          ).where((i) => !widget.tasks[i].isCompleted).toList();
    } else if (widget.showOnlyCompleted) {
      displayIndexes =
          List.generate(
            widget.tasks.length,
            (i) => i,
          ).where((i) => widget.tasks[i].isCompleted).toList();
    } else {
      displayIndexes = List.generate(widget.tasks.length, (index) => index);
    }
  }

  void _toggleComplete(int originalIndex) {
    widget.onToggleTaskCompletion?.call(originalIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child:
          widget.tasks.isEmpty
              ? const Center(
                child: Text("No tasks yet!"),
              ) // Handle empty list gracefully
              : ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: displayIndexes.length,
                itemBuilder: (context, listIndex) {
                  final index = displayIndexes[listIndex];
                  final task = widget.tasks[index]; // Get the task

                  return Container(
                    width: double.infinity,
                    height: 120,
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 1,
                          color: const Color.fromARGB(255, 32, 100, 18),
                        ),
                      ],
                      color: const Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 5, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                task.title, // Display task title
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  ClipRect(
                                    child: SlideTransition(
                                      position: _slideAnimations[index],
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.edit),
                                            color: Colors.blue.shade600,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) => EditPage(),
                                                ),
                                              );
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            color: Colors.red.shade600,
                                            onPressed: () {
                                              setState(() {
                                                widget.onDelete?.call(
                                                  index,
                                                ); // Use onDelete callback
                                                widget.tasks.removeAt(index);
                                                isEditMenuVisible.removeAt(
                                                  index,
                                                );
                                                _controllers[index].dispose();
                                                _controllers.removeAt(index);
                                                _slideAnimations.removeAt(
                                                  index,
                                                );
                                                _filterTasks();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.mode_edit_outline_outlined,
                                    ),
                                    onPressed: () => toggleEditMenu(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            task.description, // Display task description
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              height: 0.5,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${task.dateTime.hour}:${task.dateTime.minute} ${task.dateTime.day} ${task.dateTime.month}, ${task.dateTime.year}', // Display date and time
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Mark as completed',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color:
                                          task.isCompleted
                                              ? Color(0xFF33A313)
                                              : Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => _toggleComplete(index),
                                    icon: Icon(
                                      task.isCompleted
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color:
                                          task.isCompleted
                                              ? Color(0xFF33A313)
                                              : Colors.black,
                                    ),
                                  ),
                                ],
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

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
      body: Center(child: Text('Edit Task Page')),
    );
  }
}
