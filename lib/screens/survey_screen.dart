import 'package:flutter/material.dart';

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getting started'),
      ),
      body: Container(
        child: InitialForm(),
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'When do you want to start each day?',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'When do you want to end each day?',
            ),
          ),
          Switch(value: _isSwitched, onChanged: null),
          RaisedButton(
            onPressed: () {},
            child: Text('Submit'),
          )
        ],
      ),
    );
  }
}
