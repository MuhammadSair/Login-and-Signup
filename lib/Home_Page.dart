import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/Notes_page.dart';
import 'package:loginpage/edit_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final ref = FirebaseDatabase.instance.ref("Post");
  // final ref2 = FirebaseDatabase.instance.ref("notes");
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
                    // return Text("Something went wrong!");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No data found"));
                  }
                  if (snapshot.data != null) {
                    return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var noteData = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        var editNote = snapshot.data!.docs[index].data();
                        var noteText = noteData["note"];

                        // var noteTime = noteData["createdAt"].toString();
                        var userId = noteData["userId"];
                        var docId = snapshot.data!.docs[index].id;

                        return Card(
                          child: ListTile(
                            title: Text(noteText ?? ""),
                            // subtitle: Text(noteTime),
                            // subtitle: Text(userId ?? ""),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const EditNote(), arguments: {
                                      "notes": noteData,
                                      "docId": docId,
                                    });
                                  },
                                  child: const Icon(Icons.edit),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection("notes")
                                        .doc(docId)
                                        .delete();
                                  },
                                  child: const Icon(Icons.delete),
                                ),
                              ],
                            ),
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
                    builder: (context) => const Notes(),
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