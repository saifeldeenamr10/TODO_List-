import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/task.dart';
import 'home2_page.dart';
import 'profile_settings_page.dart';
import 'add_task_page.dart';
import 'lets_start_page.dart';

class Home1Page extends StatefulWidget {
  final String username;

  const Home1Page({
    super.key,
    required this.username,
  });

  @override
  State<Home1Page> createState() => _Home1PageState();
}

class _Home1PageState extends State<Home1Page> {
  final List<Task> _tasks = [];

  void _handleAddTask(Map<String, String>? result) {
    if (result != null &&
        result['title'] != null &&
        result['title']!.isNotEmpty) {
      setState(() {
        _tasks.add(Task(
          title: result['title']!,
          description: result['description'] ?? '',
          dateTime: DateTime.now(),
        ));
      });

      // Navigate to Home2Page if this is the first task
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home2Page(
            username: widget.username,
            tasks: _tasks,
          ),
        ),
      );
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LetsStartPage(),
              ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User profile section
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileSettingsPage(
                                  username: widget.username),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/palestine_flag.jpg'),
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
                              fontSize: 12,
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
                    ],
                  ),
                  // Add button
                  Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.only(top: 0),
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

              // Empty state content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 48),
                      SvgPicture.asset(
                        'assets/icons/page5.svg',
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'There are no tasks yet,',
                        style: TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        'Press the button',
                        style: TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        'To add New Task',
                        style: TextStyle(
                          fontFamily: 'LexendDeca',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
