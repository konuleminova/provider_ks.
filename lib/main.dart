import 'package:flutter/material.dart';
import 'package:flutter_kendden_shehere/page/home.dart';
import 'package:flutter_kendden_shehere/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kendden Shehere',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          builder: (_) => HomeViewModel(),
          child: HomePage(),
        ));
  }
}
