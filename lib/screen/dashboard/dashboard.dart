import 'package:evelynapp/screen/dashboard/components/body.dart';
import 'package:evelynapp/storage_service.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../components/coustom_bottom_nav_bar.dart';
// import 'package:evelynapp/dbservices.dart';
import 'package:evelynapp/enums.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
