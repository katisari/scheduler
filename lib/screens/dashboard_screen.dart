import 'package:flutter/material.dart';
import 'package:scheduler/screens/survey_screen.dart';
import 'package:scheduler/screens/calendar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text(
                'Scheduler',
                style: TextStyle(color: Colors.blue, fontSize: 30.0),
              ),
              Text('Turn your tasks into Action'),
              SizedBox(height: 300.0),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return SurveyScreen();
                      },
                    ),
                  );
                },
                child: Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
