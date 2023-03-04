import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworldcounter/style/app_stye.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.doc['note_title'],
              style: AppStyle.mainTitle,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc['created_at'],
              style: AppStyle.dateTitle,
            ),
            SizedBox(
              height: 14.0,
            ),
            Text(
              widget.doc['note_content'],
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
