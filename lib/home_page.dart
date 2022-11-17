import 'dart:async';

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

  void habitStarted(int index) {
    var startTime = DateTime.now();

    int elaspedTime = habitList[index][2];

    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    if (habitList[index][1]) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        //calculate time elasped
        setState(() {
          if (!habitList[index][1]) {
            timer.cancel();
          }
          var currentTime = DateTime.now();
          habitList[index][2] = elaspedTime +
              currentTime.second -
              startTime.second +
              (currentTime.minute - startTime.minute) * 60 +
              (currentTime.hour - startTime.hour) * 60 * 60;
        });
      });
    }
  }

  void settingsOpened(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Settings for  + ${habitList[index][0]}'),
        );
      },
    );
  }

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
