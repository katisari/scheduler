import 'package:flutter/material.dart';
import 'package:scheduler/screens/todo_screen.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Getting started'),
        ),
        body: Container(
          child: InitialForm(),
        ),
      ),
    );
  }
}

class InitialForm extends StatefulWidget {
  @override
  _InitialForm createState() => _InitialForm();
}

class _InitialForm extends State<InitialForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isSwitched = false;
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  TimeOfDay picked = TimeOfDay.now();
  String beginText = 'When do you want to start your day? 😃\n';
  String showBegin = 'When do you want to start your day? 😃\n';
  String endText = 'When do you want to end your day? 😴\n';
  String showEnd = 'When do you want to end your day? 😴\n';
  Future<Null> selectTime(BuildContext context, bool isStart) async {
    picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(
      () {
        if (isStart) {
          // account for except error
          if (picked != null) {
            _startTime = picked;
          }
        } else {
          if (picked != null) {
            _endTime = picked;
          }
        }
        showBegin = beginText + _startTime.format(context);
        showEnd = endText + _endTime.format(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              selectTime(context, true);
              print(_startTime);
            },
            child: Text(
              showBegin,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            onPressed: () {
              selectTime(context, false);
            },
            child: Text(
              showEnd,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('enable smartMode'),
              Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute<Null>(builder: (BuildContext context) {
                return TodoScreen();
              }));
              // Navigator.of(context).pushNamed(TodoScreen.routeName);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
