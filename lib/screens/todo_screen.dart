import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  static const routeName = '/todo';
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> myItems = ["Hello", "World"];
  TextEditingController dialogTextController = TextEditingController();
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
                final item = myItems[index];
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
          dialogTextController.clear();
          bool shouldUpdate = await showDialog(
            barrierDismissible: false,
            context: this.context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('New task'),
              content: TextFormField(
                controller: dialogTextController,
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
                      myItems.add(dialogTextController.text);
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
