import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Profil",
          style: TextStyle(
            fontSize: 22.5,
          ),
        ),
      ),
      body: Center(
        child: Text(" Profil"),
      ),
    );
  }
}
