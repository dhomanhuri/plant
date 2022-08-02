import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import '../../../dbservices.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final fb = FirebaseDatabase.instance;
  TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();
  var l;
  var g;
  var k;
  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('plant');
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/BG3.png"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Data',
            style: TextStyle(fontSize: 40),
          ),
          Container(
            height: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.height / 5),
            child: FirebaseAnimatedList(
              query: ref,
              shrinkWrap: true,
              itemBuilder: (context, snapshot, animation, index) {
                var v = snapshot.value
                    .toString(); // {subtitle: webfun, title: subscribe}
                // print(v);
                g = v.replaceAll(
                    RegExp("{|}|subtitle: |title: "), ""); // webfun, subscribe
                g.trim();

                l = g.split(','); // [webfun,  subscribe}]

                return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.grey,
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: HexColor("#e6e6e6"),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text("Minggu ke " + (index + 1).toString()),
                            Center(child: Text(l[0].toString().split(":")[1])),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 4,
                                  child: SizedBox(
                                    child: Center(child: Text(l[1])),
                                    // color: Colors.grey,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 4,
                                  child: SizedBox(
                                    child: Center(child: Text(l[2])),
                                    // color: Colors.grey,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
