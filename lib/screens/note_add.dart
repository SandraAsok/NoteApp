import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/styles/app_style.dart';
import 'package:noteapp/widgets/appbar.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

TextEditingController titlecontroller = TextEditingController();
TextEditingController contentcontroller = TextEditingController();
String date = DateTime.now().toString();

class _AddNoteState extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: maincolor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppbarWidget(title: "Add Note"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              TextField(
                style: normalstyle,
                cursorColor: Colors.black,
                controller: titlecontroller,
                decoration: InputDecoration(
                  hintText: "Enter Note Title",
                  hintStyle: normalstyle,
                ),
              ),
              kheight20,
              Text(date, style: normalstyle),
              kheight20,
              TextField(
                style: normalstyle,
                maxLines: 10,
                cursorColor: Colors.black,
                controller: contentcontroller,
                decoration: InputDecoration(
                  hintText: "Enter content",
                  hintStyle: normalstyle,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appbarcolor,
          onPressed: () {
            FirebaseFirestore.instance.collection('notes').add({
              'title': titlecontroller.text,
              'date': date,
              'content': contentcontroller.text,
            }).then((value) {
              log("note added");
              Navigator.of(context).pop();
            }).catchError((error) {
              log("Error adding note: $error");
            });
          },
          child: const Icon(
            Icons.save,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
