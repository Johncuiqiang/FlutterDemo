import 'package:flutter/material.dart';
import 'package:untitled/page/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  MaterialApp(
         title: '商城',
         debugShowCheckedModeBanner: false,
         theme:ThemeData(
            primaryColor: Colors.blue,
         ),
         home: IndexPage(),
      ),
    );
  }
}


