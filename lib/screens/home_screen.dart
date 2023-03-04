import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helloworldcounter/screens/contributors.dart';
import 'package:helloworldcounter/screens/note_reader.dart';
import 'package:helloworldcounter/style/app_stye.dart';
import '../widgets/note_card.dart';
import 'package:helloworldcounter/screens/note_editor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("NoteIt",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            )),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(
              "Your Recent Notes",
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            )),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("notes")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map((note) => noteCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NoteReaderScreen(note),
                                      ));
                                }, note))
                            .toList(),
                      );
                    }
                    return Text(
                      "There Are No Notes",
                      style: GoogleFonts.nunito(color: Colors.white),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'Contributors',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContributorScreen()));
              },
              child: const Icon(
                Icons.lightbulb,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              heroTag: 'Add Note',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NoteEditorScreen()));
              },
              child: const Icon(
                Icons.add,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
