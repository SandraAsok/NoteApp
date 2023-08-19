import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noteapp/screens/home_screen.dart';
import 'dart:developer';

import 'package:noteapp/styles/app_style.dart';
import 'package:noteapp/widgets/appbar.dart';

class EditNote extends StatefulWidget {
  const EditNote({
    Key? key,
    required this.id,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String id;
  final String title;
  final String content;

  @override
  // ignore: library_private_types_in_public_api
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  late String date;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    contentController.text = widget.content;
    date = DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: maincolor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(title: "Edit Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                style: normalstyle,
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter Note Title",
                ),
              ),
              kheight20,
              Text(date, style: normalstyle),
              kheight20,
              Expanded(
                child: TextField(
                  style: normalstyle,
                  controller: contentController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: "Enter content",
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            updateNote();
          },
          child: const Icon(Icons.save),
        ),
      ),
    );
  }

  void updateNote() {
    FirebaseFirestore.instance.collection('notes').doc(widget.id).update({
      'title': titleController.text,
      'date': date,
      'content': contentController.text,
    }).then((_) {
      log("Note updated");
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => const HomeScreen()));
    }).catchError((error) {
      log("Error updating note: $error");
    });
  }
}
