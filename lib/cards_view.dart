import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Task')),
      body: Center(child: Text('Edit Task Page')),
    );
  }
}

class CardsView extends StatefulWidget {
  final List<bool> isCompletedList;
  final bool showOnlyPending;
  final bool showOnlyCompleted; // Flag to control filtering
  final Function(int)? onCompletedToggle;
  // final Function(int)? onDelete;

  const CardsView({
    super.key,
    required this.isCompletedList,
    this.showOnlyPending = false,
    this.showOnlyCompleted = false,
    this.onCompletedToggle,
    required Null Function(dynamic index) onDelete,
    // required List<Task> tasks,
    // this.onDelete,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CardsViewState createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> with TickerProviderStateMixin {
  late List<int> displayIndexes;
  late List<bool> isEditMenuVisible;
  late List<AnimationController> _controllers;
  late List<Animation<Offset>> _slideAnimations; // list of indices to show

  @override
  void initState() {
    super.initState();
    _filterTasks();
    isEditMenuVisible = List.generate(
      widget.isCompletedList.length,
      (_) => false,
    );

    _controllers = List.generate(
      widget.isCompletedList.length,
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
    if (oldWidget.isCompletedList != widget.isCompletedList) {
      setState(() {
        _filterTasks(); // Re-filter whenever the parent updates the list
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
            widget.isCompletedList.length,
            (i) => i,
          ).where((i) => !widget.isCompletedList[i]).toList();
    } else if (widget.showOnlyCompleted) {
      displayIndexes =
          List.generate(
            widget.isCompletedList.length,
            (i) => i,
          ).where((i) => widget.isCompletedList[i]).toList();
    } else {
      displayIndexes = List.generate(
        widget.isCompletedList.length,
        (index) => index,
      );
    }
  }

  void _toggleComplete(int originalIndex) {
    widget.onCompletedToggle?.call(originalIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: displayIndexes.length,
        itemBuilder: (context, listIndex) {
          final index =
              displayIndexes[listIndex]; // actual index in original list
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
                  // Title row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Exercise',
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
                                          builder: (context) => EditPage(),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.red.shade600,
                                    onPressed: () {
                                      setState(() {
                                        // Remove from all internal lists
                                        widget.isCompletedList.removeAt(index);
                                        isEditMenuVisible.removeAt(index);
                                        _controllers[index].dispose();
                                        _controllers.removeAt(index);
                                        _slideAnimations.removeAt(index);
                                        _filterTasks(); // Refresh the visible list
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.mode_edit_outline_outlined),
                            onPressed: () => toggleEditMenu(index),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Subtitle
                  Text(
                    'Carry out a yoga session',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                      height: 0.5,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Bottom row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '10:30 PM 19 Feb, 2025',
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
                                  widget.isCompletedList[index]
                                      ? Color(0xFF33A313)
                                      : Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _toggleComplete(index),
                            icon: Icon(
                              widget.isCompletedList[index]
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color:
                                  widget.isCompletedList[index]
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
