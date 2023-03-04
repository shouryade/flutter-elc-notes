import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helloworldcounter/style/app_stye.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(18.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            doc['note_title'],
            style: AppStyle.mainTitle,
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            doc['created_at'],
            style: AppStyle.dateTitle,
          ),
          SizedBox(
            height: 14.0,
          ),
          Text(
            doc['note_content'],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
