import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/app_stye.dart';

class ContributorScreen extends StatefulWidget {
  const ContributorScreen({Key? key}) : super(key: key);

  @override
  State<ContributorScreen> createState() => _ContributorScreenState();
}

class _ContributorScreenState extends State<ContributorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.mainColor,
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Created with <3 by Moisture Bois",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              )),
          centerTitle: true,
          backgroundColor: AppStyle.mainColor,
        ),
        body: Container(
            child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '''
            Shourya De                                 (102116106)
            Sajal Jain                                       (102116080)
            Madhur Gaba                             (102116082)
            Rochak Ranjan                           (102116077)
            Aakash Rustagi                          (102116087)
            Dhruv Kikan                                (102116078)''',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
        )));
  }
}
