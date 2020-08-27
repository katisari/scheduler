import 'package:flutter/material.dart';
import 'package:scheduler/screens/calendar_screen.dart';
import 'package:sqflite/sqflite.dart';

class TodoScreen extends StatefulWidget {
  static const routeName = '/todo';
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TaskData {
  String taskName;
  int hours;
  bool isPriority;
  TaskData(this.taskName, this.hours, this.isPriority);
}

class _TodoScreenState extends State<TodoScreen> {
  List<TaskData> myItems = [];
  TextEditingController taskTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();
  bool isNumeric(String str) => num.tryParse(str) != null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        actions: [
          IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return CalendarScreen();
                    },
                  ),
                );
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myItems.length,
              itemBuilder: (context, index) {
                final itemName = myItems[index].taskName;
                final itemTime = myItems[index].hours;
                final itemPrioritized = myItems[index].isPriority;
                return Dismissible(
                  key: Key(itemName),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    setState(() {
                      myItems.removeAt(index);
                    });
                  },
                  child: ListTile(
                    leading: Text('$itemName'),
                    title: Align(
                      child: (itemPrioritized)
                          ? IconButton(
                              icon: Icon(Icons.flag),
                              onPressed: () {
                                setState(() {
                                  myItems.removeAt(index);
                                  myItems
                                      .add(TaskData(itemName, itemTime, false));
                                });
                              })
                          : IconButton(
                              icon: Icon(Icons.flag_outlined),
                              onPressed: () {
                                setState(() {
                                  myItems.removeAt(index);
                                  myItems.insert(
                                      0, TaskData(itemName, itemTime, true));
                                });
                              }),
                      alignment: Alignment(1, 0),
                    ),
                    trailing: Text('$itemTime'),
                  ),
                );
              },
            ),
          ),
          Visibility(
            child: Container(
              height: 50.0,
              color: Colors.black,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          taskTextController.clear();
          timeTextController.clear();
          bool shouldUpdate = await showDialog(
            barrierDismissible: false,
            context: this.context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('New task'),
              content: Container(
                height: 150,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Task Name'),
                      controller: taskTextController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Approximate time in hours'),
                      controller: timeTextController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      myItems.add(TaskData(taskTextController.text,
                          int.parse(timeTextController.text), false));
                    });
                  },
                  child: Text('Add'),
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
