import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'component/video.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // final _controller = PageController(initialPage: 0);
  late Future<List<DocumentSnapshot>> futureDocuments;

  @override
  void initState() {
    super.initState();
    futureDocuments = getDocumentsInCollection();
  }

  Future<List<DocumentSnapshot>> getDocumentsInCollection() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('post').get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: PopupMenuButton(itemBuilder: (BuildContext context) {
          return [
            PopupMenuItem(
              child: TextButton(
                onPressed: () {},
                child: Text("Catégorie1"),
              ),
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {},
                child: Text("Catégorie2"),
              ),
            ),
          ];
        }),
        title: Text(
          "Tik tok",
          style: TextStyle(
            fontSize: 22.5,
          ),
        ),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Recent"),
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {},
                  child: Text("Like"),
                ),
              ),
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {},
                  child: Text("Commentaire"),
                ),
              ),
            ];
          })
        ],
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: futureDocuments,
        builder: (BuildContext context,
            AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Aucune video'));
          } else {
            List<DocumentSnapshot> documents = snapshot.data!;
            return PageView(
              scrollDirection: Axis.vertical,
              children: documents.map((item) {
                return VideoPlayerComponent(
                  media: item["pathvideo"],
                  category: item['category'],
                  description: item["description"],
                  nombreLike: item["nombreslikes"],
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
