import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/Notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ref = FirebaseDatabase.instance.ref("Post");
  final ref2 = FirebaseDatabase.instance.ref("notes");
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("notes")
                    .where("userId", isEqualTo: userId?.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Something went wrong!");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No data found");
                  }
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data!.docs[index]["notes"]),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
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
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
          // Expanded(
          //   child: FirebaseAnimatedList(
          //     query: ref,
          //     itemBuilder: (context, snapshot, animation, index) {
          //       // Assuming each item in the list has a 'Title' and 'id' field
          //       final title = snapshot.child('Title').value.toString();
          //       final postId = snapshot.child('id').value.toString();

          //       return ListTile(
          //         title: Text('Post ID: $postId\nTitle: $title'),
          //       );
          //     },
          //   ),
          // ),