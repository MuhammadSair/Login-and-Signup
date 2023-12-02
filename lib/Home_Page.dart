import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/Notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ref = FirebaseDatabase.instance.ref("Post");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  // Assuming each item in the list has a 'Title' and 'id' field
                  final title = snapshot.child('Title').value.toString();
                  final postId = snapshot.child('id').value.toString();

                  return ListTile(
                    title: Text('Post ID: $postId\nTitle: $title'),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Notes(),
                  ),
                )
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
