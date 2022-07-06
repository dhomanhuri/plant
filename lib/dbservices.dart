import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evelynapp/dataclass.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

CollectionReference tablePlant = FirebaseFirestore.instance.collection("plant");

class Database {
  static Stream<QuerySnapshot> getData() {
    return tablePlant.snapshots();
  }

  static Future<void> addData({required Plant item}) async {
    DocumentReference docRef = tablePlant.doc();

    await docRef
        .set(item.toJson())
        .whenComplete(() => print("data berhasil disimpan"))
        .catchError((e) => print(e));
  }

  // static Future<dynamic> loadImage(BuildContext context, String image) async {
  //   return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  // }
}
