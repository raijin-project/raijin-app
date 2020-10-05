import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  Map<String, String> _formData = Map();

  TextFormField _field(String hintText, {bool obfuscate = false}) {
    return TextFormField(
        decoration: InputDecoration(hintText: hintText),
        obscureText: obfuscate,
        onSaved: (value) {
          _formData[hintText] = value;
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Field is required';
          }
          return null;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Login"),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _field('Instance'),
                  _field('Username'),
                  _field('Password', obfuscate: true),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text("Submit"),
                      onPressed: () {})
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
