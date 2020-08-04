import 'package:flutter/material.dart';
import 'package:scheduler/screens/survey_screen.dart';
import 'package:scheduler/screens/todo_screen.dart';
import 'package:scheduler/screens/calendar_screen.dart';
import 'package:scheduler/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => DashboardScreen(),
        SurveyScreen.routeName: (context) => SurveyScreen(),
        TodoScreen.routeName: (context) => TodoScreen(),
        CalendarScreen.routeName: (context) => CalendarScreen(),
      },
    );
  }
}
