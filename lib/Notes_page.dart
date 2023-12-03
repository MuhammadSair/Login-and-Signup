import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final TextEditingController _noteController = TextEditingController();
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Notes"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              maxLines: null,
              controller: _noteController,
              decoration: const InputDecoration(hintText: ("Note")),
            ),
            ElevatedButton(
                onPressed: () async {
                  var note = _noteController.text.trim();
                  if (note != "") {
                    try {
                      await FirebaseFirestore.instance
                          .collection("notes")
                          .doc()
                          .set({
                        "createdAt": DateTime.now(),
                        "note": note,
                        "userId": userId?.uid,
                      });
                      // _noteController.clear();
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                },
                child: const Text("Create"))
          ],
        ),
      ),
    );
  }
}
