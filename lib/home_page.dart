import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Consistency is key.'),
        backgroundColor: Colors.grey[900],
        centerTitle: false,
      ),
      body: Column(
        children: const [
          Tile(
            habitName: 'Exercise',
          ),
          Tile(
            habitName: 'Read',
          ),
          Tile(
            habitName: 'Meditate',
          ),
          Tile(
            habitName: 'Code',
          ),
        ],
      ),
    );
  }
}
