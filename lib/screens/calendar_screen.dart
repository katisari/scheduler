import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  static const routeName = '/calendar';
  CalendarScreen({Key key}) : super(key: key);
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calendar'),
        actions: [
          // IconButton(icon: Icon(Icons.calendar_today), onPressed: () {})
        ],
      ),
      body: Container(
        child: SfCalendar(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.blue,
      // ),
    );
  }
}

// class CalendarScreen extends StatelessWidget {
//   static const routeName = '/calendar';
//   // final String categoryID;
//   // final String categoryTitle;

//   // CategoryMealsScreen(this.categoryID, this.categoryTitle);
//   List<String> myItems = ["Hello"];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo'),
//         actions: [
//           IconButton(icon: Icon(Icons.calendar_today), onPressed: () {})
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: myItems.length,
//         itemBuilder: (context, index) {
//           final item = myItems[index];
//           return Dismissible(
//             key: Key(item),
//             background: Container(color: Colors.red),
//             onDismissed: (direction) {
//               setState(() {
//                 myItems.removeAt(index);
//               });
//             },
//             child: ListTile(
//               title: Text('$item'),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add your onPressed code here!
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }
// }
