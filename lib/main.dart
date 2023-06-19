import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maple_homework/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DateTime focusDay;
  @override
  void initState() {
    super.initState();
    focusDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              focusDay = focusDay.add(const Duration(days: -1));
                              if (getDailyEventsForDay(focusDay).isEmpty) {
                                addDailyEvents(focusDay);
                              }
                            });
                          },
                          icon: const Icon(Icons.chevron_left_rounded)),
                      Text(
                        DateFormat('yyyy년 MM월 dd일').format(focusDay),
                        style: const TextStyle(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              focusDay = focusDay.add(const Duration(days: 1));
                              if (getDailyEventsForDay(focusDay).isEmpty) {
                                addDailyEvents(focusDay);
                              }
                            });
                          },
                          icon: const Icon(Icons.chevron_right_rounded)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: getDailyEventsForDay(focusDay).length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          getDailyEventsForDay(focusDay)[index].title,
                          style: TextStyle(
                            color: getDailyEventsForDay(focusDay)[index].done ? Colors.black26 : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Daily',
                          style: TextStyle(
                            color: getDailyEventsForDay(focusDay)[index].done ? Colors.black26 : Colors.black,
                          ),
                        ),
                        leading: IconButton(
                          onPressed: () {
                            setState(() {
                              getDailyEventsForDay(focusDay)[index].done = !getDailyEventsForDay(focusDay)[index].done;
                            });
                          },
                          icon: getDailyEventsForDay(focusDay)[index].done
                              ? const Icon(Icons.check_box_rounded)
                              : const Icon(Icons.check_box_outline_blank_rounded),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
