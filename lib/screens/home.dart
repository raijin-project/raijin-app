import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raijin/models/app.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppBar _appBar() => AppBar(
        title: Text('Raijin'),
      );

  Widget _body() => Consumer<AppModel>(builder: (context, app, child) {
        if (!app.loggedIn) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to Raijin'),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text('Login'),
                  color: Colors.blue,
                ),
              ],
            ),
          );
        } else {
          return Text('WIP');
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }
}
