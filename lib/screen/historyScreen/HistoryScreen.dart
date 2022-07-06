import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evelynapp/screen/historyScreen/components/body.dart';
import 'package:flutter/material.dart';

import '../../components/coustom_bottom_nav_bar.dart';

import 'package:evelynapp/enums.dart';

import '../../dbservices.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: Container(),
      ),
      body: Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
