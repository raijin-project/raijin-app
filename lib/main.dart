import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raijin/common/theme.dart';
import 'package:raijin/models/app.dart';
import 'package:raijin/screens/home.dart';
import 'package:raijin/screens/login.dart';
import 'package:raijin/screens/register.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => AppModel(), child: App()),
  );
}

class App extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      title: 'Raijin',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
      },
    );
  }
}
