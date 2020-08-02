import 'package:flutter/material.dart';

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
  TaskData(this.taskName, this.hours);
}

class _TodoScreenState extends State<TodoScreen> {
  List<TaskData> myItems = [];
  TextEditingController taskTextController = TextEditingController();
  TextEditingController timeTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        actions: [
          IconButton(icon: Icon(Icons.calendar_today), onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: myItems.length,
              itemBuilder: (context, index) {
                final item = myItems[index].taskName;
                return Dismissible(
                  key: Key(item),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    setState(() {
                      myItems.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text('$item'),
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
              content: Column(
                children: [
                  TextFormField(
                    controller: taskTextController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Approximate time'),
                    controller: timeTextController,
                    keyboardType: TextInputType.number,
                  ),
                ],
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
                      myItems.add(TaskData(taskTextController.text, 3));
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
