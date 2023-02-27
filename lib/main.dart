import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deeplaid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}


