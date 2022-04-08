import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../data/service_method.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {

  String homePageContent = '正在获取数据';

  @override
  void initState() {
    getHomePageData().then((value) {
      setState(() {
        homePageContent = value.toString();
      });
    });
    super.initState();
  }

  Widget _gridViewItemUI(BuildContext context,item) {
    return InkWell(
        onTap: () {
          print('点击了导航');
        },
        //FittedBox是为了解决溢出像素的问题，子view大于父view
        child: FittedBox (
          child: Column(
            children: [
              Image.network(item['image'], width: 60,fit: BoxFit.fill),
              Text(item['name'])
            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    if('正在获取数据' == homePageContent) {
      return Center(child: Text(homePageContent));
    } else {
      var data = json.decode(homePageContent);
      List<Map> gridList = (data['data']['type'] as List).cast();
      List<Map> goodsList = (data['data']['recommend'] as List).cast();
      return NestedScrollView(
        body: GridView.count(
          crossAxisCount: 5,
          mainAxisSpacing: 12,
          childAspectRatio: 1.0,
          children: gridList
              .map((item) => _gridViewItemUI(context, item))
              .toList(),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('嵌套ListView'),
              pinned: true, // 固定在顶部
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
      );
    }
  }
}


// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => Counter()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//
//   int _count = 0;
//
//   int get count => _count;
//
//   void increment() {
//     _count++;
//     notifyListeners();
//   }
//
//   /// Makes `Counter` readable inside the devtools by listing all of its properties
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('count', count));
//   }
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   void _incrementCounter() {
//     context.read<Counter>().increment();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Count(),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//
// class Count extends StatelessWidget {
//   const Count({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//
//       /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
//         '${context.watch<Counter?>()?.count ?? 1}',
//         key: const Key('counterState'),
//         style: Theme.of(context).textTheme.headline4);
//   }
// }