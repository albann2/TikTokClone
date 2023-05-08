import 'package:flutter/material.dart';
import 'package:tiktokclone/screen/nav.dart';

import '../model/userModel.dart';
import 'guest/auth.dart';
import 'guest/password.dart';
import 'guest/term.dart';
import 'service/userService.dart';

class GuestLogin extends StatefulWidget {
  const GuestLogin({super.key});

  @override
  State<GuestLogin> createState() => _GuestLoginState();
}

class _GuestLoginState extends State<GuestLogin> {
  UserService _userService = UserService();

  List<Widget> _widget = [];
  int _indexPage = 0;
  late String _email, _pass;

  @override
  void initState() {
    super.initState();

    _widget.addAll([
      AuthSreen(onChangedStep: (index, value) {
        setState(() {
          _indexPage = index;
          _email = value;
        });
      }),
      TermSreen(onChangedStep: (index) => setState(() => _indexPage = index)),
      PasswordSreen(onChangedStep: (index, value) {
        setState(() {
          if (index == 3) {
            _pass = value;
            _userService.auth(UserModel(
              email: _email,
              pass: _pass,
              uid: " ",
            ));
          }
          _indexPage = index;
        });
      }),
      NavPage(onChangedStep: (index) => setState(() => _indexPage = index)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _widget.elementAt(_indexPage));
  }
}
