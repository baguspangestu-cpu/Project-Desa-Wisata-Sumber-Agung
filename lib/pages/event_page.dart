import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        Card(
          child: ListTile(
            leading: Icon(Icons.event),
            title: Text("Festival Budaya"),
            subtitle: Text("20 Juni 2025"),
          ),
        ),

        Card(
          child: ListTile(
            leading: Icon(Icons.music_note),
            title: Text("Pentas Seni"),
            subtitle: Text("25 Juni 2025"),
          ),
        ),
      ],
    );
  }
}