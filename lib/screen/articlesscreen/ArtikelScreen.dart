import 'package:flutter/material.dart';
import 'package:evelynapp/screen/articlesscreen/components/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';

import 'package:evelynapp/enums.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        leading: Container(),
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
