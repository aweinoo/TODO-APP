import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:to_do_app/bottomnavbar.dart';

class AddTaskPage extends StatefulWidget {
  final Function(Task) onAddTask; // Callback to pass data back
  const AddTaskPage({Key? key, required this.onAddTask}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 16),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFf5f5f5),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Task title',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: titleController,
              showCursor: true,
              cursorColor: const Color.fromARGB(255, 32, 100, 18),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w100,
              ),
              maxLines: 1,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 32, 100, 18),
                  ),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                labelText: 'Eg. Buy groceries',
                labelStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                  fontWeight: FontWeight.w700,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Task Description
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Task description',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: descriptionController,
              showCursor: true,
              cursorColor: const Color.fromARGB(255, 32, 100, 18),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w100,
              ),
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 32, 100, 18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Set Dealine
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Set Deadline',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => _selectDateTime(context),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black54),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        selectedDateTime != null
                            ? DateFormat(
                              'yyyy-MM-dd HH:mm',
                            ).format(selectedDateTime!)
                            : 'Select date and time',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              selectedDateTime != null
                                  ? Colors.black87
                                  : Colors.black45,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _selectDateTime(context),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: 270),
            const Spacer(), // Add this to push the button to the bottom
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF9B64E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      selectedDateTime != null) {
                    final newTask = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      dateTime: selectedDateTime!,
                    );
                    widget.onAddTask(newTask); // Send data back
                    // Navigate to the Home page
                    Navigator.pop(context); // Pop the Add Task page
                    if (Navigator.canPop(context)) {
                      Navigator.pop(
                        context,
                      ); // Pop again if possible to go back to Home
                    } else {
                      // If not possible to pop further, navigate to Home directly
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavBar(),
                        ), // Assuming BottomNavBar is your main navigation
                      );
                    }
                  } else {
                    // Show a message if any field is empty
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please fill in all fields and select date and time.',
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Add Task',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  String title;
  String description;
  DateTime dateTime;

  Task({
    required this.title,
    required this.description,
    required this.dateTime,
  });
}
