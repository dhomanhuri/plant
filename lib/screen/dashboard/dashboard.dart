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
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Dashboard"),
      // ),
      // body: Column(
      //   children: [
      //     Center(
      //       child: ElevatedButton(
      //         onPressed: () async {
      //           final results = await FilePicker.platform.pickFiles(
      //             allowMultiple: false,
      //             type: FileType.custom,
      //             allowedExtensions: ['png', 'jpg'],
      //           );

      //           if (results == null) {
      //             ScaffoldMessenger.of(context).showSnackBar(
      //               const SnackBar(
      //                 content: Text('No File Selected.'),
      //               ),
      //             );
      //             return null;
      //           }
      //           final path = results.files.single.path!;
      //           final fileName = results.files.single.name;
      //           print(path);
      //           print(fileName);
      //           storage
      //               .uploadFile(path, fileName)
      //               .then((value) => print('done'));
      //         },
      //         child: Text('upload file'),
      //       ),
      //     ),
      // FutureBuilder(
      //   future: storage.listFiles(),
      //   builder: (BuildContext context,
      //       AsyncSnapshot<firebase_storage.ListResult> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done &&
      //         snapshot.hasData) {
      //       return Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         height: 50,
      //         child: ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           shrinkWrap: true,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: ElevatedButton(
      //                 onPressed: () {},
      //                 child: Text(snapshot.data!.items[index].name),
      //               ),
      //             );
      //           },
      //         ),
      //       );
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting ||
      //         !snapshot.hasData) {
      //       return CircularProgressIndicator();
      //     }
      //     return Container();
      //   },
      // ),

      // FutureBuilder(
      //   future: storage.downloadURL('2022-07-07-20-28-32-944059047.png'),
      //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done &&
      //         snapshot.hasData) {
      //       return Container(
      //           width: 300,
      //           height: 250,
      //           child: Image.network(
      //             snapshot.data!,
      //             fit: BoxFit.cover,
      //           ));
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting ||
      //         !snapshot.hasData) {
      //       return const CircularProgressIndicator();
      //     }
      //     return Container();
      //   },
      // ),

      //   ],
      // ),

      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
