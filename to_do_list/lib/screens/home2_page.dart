import 'package:flutter/material.dart';
import '../models/task.dart';
import 'profile_settings_page.dart';
import 'add_task_page.dart';
import 'lets_start_page.dart';

class Home2Page extends StatefulWidget {
  final String username;
  final List<Task> tasks;

  const Home2Page({
    super.key,
    required this.username,
    required this.tasks,
  });

  @override
  State<Home2Page> createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks = List.from(widget.tasks);
  }

  void _handleAddTask(Map<String, String>? result) {
    if (result != null) {
      setState(() {
        _tasks.add(Task(
          title: result['title']!,
          description: result['description'] ?? '',
          dateTime: DateTime.now(),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LetsStartPage(),
              ),
              (route) => false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with user info and add button
              Row(
                children: [
                  // User profile section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileSettingsPage(username: widget.username),
                        ),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/palestine_flag.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello!',
                        style: TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF24252C),
                        ),
                      ),
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF24252C),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Add button
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black87,
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, size: 16),
                      onPressed: () async {
                        final result =
                            await Navigator.push<Map<String, String>>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTaskPage(),
                          ),
                        );
                        _handleAddTask(result);
                      },
                      color: Colors.black87,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Tasks header with count
              Row(
                children: [
                  const Text(
                    'Tasks',
                    style: TextStyle(
                      fontFamily: 'LexendDeca',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 14, height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F9E44).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      _tasks.length.toString(),
                      style: const TextStyle(
                        fontFamily: 'LexendDeca',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2F9E44),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Tasks list
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      width: 335,
                      height: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCEEBDC),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      task.title,
                                      style: const TextStyle(
                                        fontFamily: 'LexendDeca',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        height: 1.0,
                                        letterSpacing: 0,
                                        color: Color(0xFF6E6A7C),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      task.description,
                                      style: const TextStyle(
                                        fontFamily: 'LexendDeca',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        height: 1.0,
                                        letterSpacing: 0,
                                        color: Color(0xFF24252C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${task.dateTime.day}/${task.dateTime.month}/${task.dateTime.year}\n'
                                '${task.dateTime.hour.toString().padLeft(2, '0')}:${task.dateTime.minute.toString().padLeft(2, '0')} ${task.dateTime.hour >= 12 ? 'PM' : 'AM'}',
                                style: const TextStyle(
                                  fontFamily: 'LexendDeca',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                  letterSpacing: 0,
                                  color: Color(0xFF6E6A7C),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
