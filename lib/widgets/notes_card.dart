import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/styles/app_style.dart';

Widget noteCard(Function() onTap, QueryDocumentSnapshot doc, int color) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.green.shade300,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["title"],
            style: titlestyle,
            overflow: TextOverflow.ellipsis,
          ),
          kheight10,
          Text(
            doc["date"],
            style: datestyle,
          ),
          kheight10,
          Text(
            doc["content"],
            style: contentstyle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
