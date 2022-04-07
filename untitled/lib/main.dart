import 'package:flutter/material.dart';
import 'package:untitled/page/index_page.dart';
import 'package:fluro/fluro.dart';
import 'package:untitled/router/application.dart';

import 'router/router.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
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
         onGenerateRoute: Application.router.generator,
         theme:ThemeData(
            primaryColor: Colors.blue,
         ),
         home: IndexPage(),
      ),
    );
  }
}


