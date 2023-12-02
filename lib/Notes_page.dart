import 'package:flutter/material.dart';
import 'package:loginpage/Home_Page.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Notes"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          backgroundColor: Colors.red.shade900,
          child: Icon(Icons.add)),
    );
  }
}
