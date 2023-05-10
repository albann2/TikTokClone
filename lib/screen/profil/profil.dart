
import 'dart:io';
import'package:image_picker/image_picker.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String _username = "Username";
  String _profilePic="";

  void _openEditProfilePage() async {
    final newProfile = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EditProfilePage(
          username: _username,
          profilePic: _profilePic,
        ),
      ),
    );

    if (newProfile != null) {
      setState(() {
        _username = newProfile["username"] ?? _username;
        _profilePic = newProfile["profilePic"] ?? _profilePic;
      });
    }
  }

  List<String> _videos = [
    'Video 1',
    'Video 2',
    'Video 3',
    'Video 4',
    'Video 5',
    'Video 6',
    'Video 7',
    'Video 8',
    'Video 9',
    'Video 10'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "YOUR PROFIL",
          style: TextStyle(
            fontSize: 22.5,
            color: Colors.blue[300],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(_profilePic),
            
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            _username,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: _openEditProfilePage,
            child: const Text("Modifier le profil"),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                final video = _videos[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(video),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          
        ],
      ),
    );
  }
}


class EditProfilePage extends StatefulWidget {
  final String username;
  final String profilePic;

  const EditProfilePage({
    Key? key,
    required this.username,
    required this.profilePic,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _usernameController;
  late TextEditingController _profilePicController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _verifyPasswordController;

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
    _profilePicController = TextEditingController(text: widget.profilePic);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _verifyPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _profilePicController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _verifyPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final newUsername = _usernameController.text;
    final newProfilePic =
        _selectedImage != null ? _selectedImage!.path : _profilePicController.text;
    final newEmail = _emailController.text;
    final newPassword = _passwordController.text;
    final newVerifyPassword = _verifyPasswordController.text;

    // Do something with the email, password, and verify-password fields

    Navigator.of(context).pop({
      'username': newUsername,
      'profilepic': newProfilePic,
    });
  }

  @override
  Widget build(BuildContext context) {
    //var   backgroundImage = NetworkImage(widget.profilePic);
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier le profil"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: (_selectedImage != null
                  ? FileImage(_selectedImage!)
                  : NetworkImage(widget.profilePic)) as ImageProvider,
              //backgroundImage:backgroundImage
              //backgroundImage:  FileImage(_selectedImage!),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Nom d'utilisateur",
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _verifyPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Verify Password",
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  _selectedImage = File(image!.path);
                });
              },
              child: Text("Sélectionner depuis la galerie"),
            ),
            ElevatedButton(
              onPressed: () async {
                final image = await ImagePicker().pickImage(source: ImageSource.camera);
                setState(() {
                  _selectedImage = File(image!.path);
                });
              },
              child: Text("Prendre une photo"),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text("Enregistrer les modifications"),
            ),
          ],
        ),
      ),
    );
  }
}
