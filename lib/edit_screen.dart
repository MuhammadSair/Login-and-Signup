import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _editingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Screen"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              maxLines: null,
              controller: _editingController
                ..text = Get.arguments["notes"]["note"].toString(),
              decoration: const InputDecoration(hintText: ("Edit")),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("notes")
                      .doc(Get.arguments['docId'].toString())
                      .update({
                    "note": _editingController.text.trim(),
                  });
                },
                child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
