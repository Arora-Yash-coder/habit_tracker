import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Habit List
  List habitList = [
    ['Excersice', false, 0, 10],
    ['Code', false, 0, 10],
    ['Meditate', false, 0, 10],
    ['Read', false, 0, 10],
  ];

  void habitStarted(int index) {}

  void settingsOpened(int index) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('Consistency is key.'),
          backgroundColor: Colors.grey[900],
          centerTitle: false,
        ),
        body: ListView.builder(
          itemCount: habitList.length,
          itemBuilder: (context, index) {
            return Tile(
              habitName: habitList[index][0],
              habitStarted: habitList[index][1],
              onTap: () => habitStarted(index),
              settingsTap: () => settingsOpened(index),
              timeSpent: habitList[index][2],
              timeGoal: habitList[index][3],
            );
          },
        ));
  }
}
