import 'package:flutter/material.dart';

import 'term.dart';

class PasswordSreen extends StatefulWidget {
  const PasswordSreen({super.key});

  @override
  State<PasswordSreen> createState() => _PasswordSreenState();
}

class _PasswordSreenState extends State<PasswordSreen> {
  bool _isSecret = true;
  String _pass = " ";
  String _passw = " ";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password".toUpperCase(),
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Enter your password'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _passw = value),
                        validator: (value) => value!.length < 8
                            ? 'Enter a password, 6 characters min requiered'
                            : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => setState(() => _isSecret = !_isSecret),
                            child: Icon(!_isSecret
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: 'Ex: gvjbkjk8',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('Confirme your password'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _pass = value),
                        validator: (value) {
                          if (value!.isEmpty || _passw.isEmpty) {
                            return 'password not match';
                          } else {
                            if (value != _passw) return 'password not match';
                          }
                          return null;
                        },
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 0.0,
                          ),
                          elevation: 0,
                        ),
                        onPressed: _pass.length < 8
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  print("yes");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TermSreen()),
                                  );
                                }
                              },
                        child: Text(
                          'Continue'.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
