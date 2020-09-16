import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  Map<String, String> _formData = Map();

  Future<Map> _submit(_formData) async {
    final String url = _formData['Instance'] + '/api/users';

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user': {
            'email': _formData['Email'],
            'username': _formData['Username'],
            'password': _formData['Password']
          }
        }));
    // Remember to remove this
    print(response.body);
    return jsonDecode(response.body);
  }

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
        title: Text("Register"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _field('Instance'),
                _field('Email'),
                _field('Username'),
                _field('Password', obfuscate: true),
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      Future<Map> result = _submit(_formData);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
