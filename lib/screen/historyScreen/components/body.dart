import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';

import '../../../dbservices.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/image/BG3.png"), fit: BoxFit.cover),
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: Database.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error");
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
              itemBuilder: ((context, index) {
                DocumentSnapshot dsdata = snapshot.data!.docs[index];
                String lvJumlah = dsdata['jumlah'];
                String lvpanjang = dsdata['panjang'];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor("#e6e6e6"),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Minggu ke " + (index + 1).toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 4,
                              child: Container(
                                child: Center(child: Text(lvpanjang)),
                                // color: Colors.grey,
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 4,
                              child: Container(
                                child: Center(child: Text(lvJumlah)),
                                // color: Colors.grey,
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 10,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
              separatorBuilder: (context, index) => SizedBox(height: 8.0),
              itemCount: snapshot.data!.docs.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
            ),
          );
        },
      ),
    );
  }
}
