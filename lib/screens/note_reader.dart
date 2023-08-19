import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/screens/note_edit.dart';
import 'package:noteapp/styles/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen({
    super.key,
    required this.doc,
    required this.index,
  });

  final QueryDocumentSnapshot doc;
  final int index;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cardscolor[widget.index],
        appBar: AppBar(
          backgroundColor: cardscolor[widget.index],
          leading: const Icon(Icons.navigate_before, color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: (context) {
                    return EditNote(
                        id: widget.doc.id,
                        title: widget.doc['title'],
                        content: widget.doc['content']);
                  }));
                },
                icon: const Icon(Icons.edit, color: Colors.black)),
            IconButton(
                onPressed: () {
                  deleteNote();
                },
                icon: const Icon(Icons.delete, color: Colors.black)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc["title"],
                style: titlestyle,
              ),
              kheight10,
              Text(
                widget.doc["date"],
                style: datestyle,
              ),
              kheight10,
              Text(
                widget.doc["content"],
                style: contentstyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: maincolor,
          title: Text("Confirm Deletion", style: headingstyle),
          content: Text(
            "Are you sure you want to delete this note?",
            style: normalstyle,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                "Cancel",
                style: normalstyle,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                performDeleteNote(); // Actually delete the note
              },
              child: Text(
                "Delete",
                style: normalstyle,
              ),
            ),
          ],
        );
      },
    );
  }

  void performDeleteNote() {
    FirebaseFirestore.instance
        .collection('notes')
        .doc(widget.doc.id)
        .delete()
        .then((_) {
      log("Note deleted");
      Navigator.of(context).pop(); // Close the edit page
    }).catchError((error) {
      log("Error deleting note: $error");
    });
  }
}
