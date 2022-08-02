// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:evelynapp/dbservices.dart';
import 'package:evelynapp/storage_service.dart';

import 'package:firebase_database/firebase_database.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController second = TextEditingController();

  TextEditingController third = TextEditingController();

  final fb = FirebaseDatabase.instance;
  final Storage storage = Storage();

  String _selectedValue = '';
  String batang = '';
  String daun = '';

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child('capture/waiting');
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/BG3.png"), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // const SizedBox(height: 70),
          DatePicker(
            DateTime(2022, 7, 1),
            initialSelectedDate: DateTime.now(),
            selectionColor: HexColor("#003333"),
            // startDate:DateTime(2022, 1, 1),
            selectedTextColor: Colors.white,
            height: 100,
            onDateChange: (date) {
              // New date selected
              setState(
                () {
                  _selectedValue = date.toString();
                  var splitag = _selectedValue.split(" ");
                  batang = 'batang-' + splitag[0].toString() + '.png';
                  daun = 'daun-' + splitag[0].toString() + '.png';
                  // print('batang = ' + batang);
                  // print('daun = ' + daun);
                },
              );
            },
          ),
          // const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 2.5,
                // color: Colors.black,
                child: Card(
                  color: HexColor("#003333"),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.spaceEvenly,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FutureBuilder(
                        future: storage.downloadURL(batang),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(snapshot.data!),
                            );
                          }
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              !snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return Container();
                        },
                      ),
                      const Text(
                        "Pertambahan Tinggi Batang",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 2.5,
                alignment: Alignment.center,
                child: Card(
                  color: HexColor("#003333"),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FutureBuilder(
                        future: storage.downloadURL(daun),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(snapshot.data!),
                            );
                          }
                          if (snapshot.connectionState ==
                                  ConnectionState.waiting ||
                              !snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          return Container();
                        },
                      ),
                      const Text(
                        "Jumlah Daun Terdeteksi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Card(
              color: HexColor("#003333"),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt_rounded,
                      ),
                      iconSize: 50,
                      color: Colors.white,
                      splashColor: Colors.purple,
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Request Update Photos"),
                        ));
                        ref.set({
                          "status": true,
                        }).asStream();
                        // Navigator.pushReplacement(
                        //     context, MaterialPageRoute(builder: (_) => Home() ));
                      },
                    ),
                    Text(
                      'Perbarui Foto',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class FireStorageService extends ChangeNotifier {
//   FireStorageService();
//   static Future<dynamic> loadImage(BuildContext context, String image) async {
//     return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
//   }
// }
