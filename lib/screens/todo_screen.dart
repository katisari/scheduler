import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  static const routeName = '/todo';
  // final String categoryID;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryID, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: ListView(
        children: [
          Text('hello'),
        ],
      ),
    );
  }
}
