import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import '../../../models/articles.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget buildArticles(Articles articles) => Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(18),
        margin: const EdgeInsets.all(10),
        width: double.infinity,

        height: 200,
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: HexColor("#e6e6e6"),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(articles.title),
            Text(articles.isi),
          ],
        ),
      );
  Stream<List<Articles>> readArticles() => FirebaseFirestore.instance
      .collection('articles')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Articles.fromJson(doc.data())).toList());
  @override
  Widget build(BuildContext context) {
    // var listView = ListView.builder(
    //   itemCount: 5,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       alignment: Alignment.topLeft,
    //       padding: const EdgeInsets.all(18),
    //       margin: const EdgeInsets.all(10),
    //       width: double.infinity,

    //       height: 200,
    //       // height: MediaQuery.of(context).size.height,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           color: HexColor("#e6e6e6")),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [Text("juduls" + index.toString()), const Text("data")],
    //       ),
    //     );
    //   },
    // );
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/BG3.png"), fit: BoxFit.cover),
      ),
      child: StreamBuilder<List<Articles>>(
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasError) {
            return const Text("asdsad");
          } else if (snapshot.hasData) {
            final articles = snapshot.data!;
            return ListView(
              children: articles.map(buildArticles).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
