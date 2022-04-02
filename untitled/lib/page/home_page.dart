

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends  StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String showText ='';

  @override
  Widget build(BuildContext context) {
     return Container(
       child: Scaffold(
         appBar: AppBar(title: Text('首页')),
         body: Container(
           child: Column(
             children: <Widget>[
                TextField(
                   controller: TextEditingController(),
                   decoration: InputDecoration(
                     contentPadding: EdgeInsets.all(10.0),
                     labelText: '首页类型',
                     helperText: '请输入你喜欢的类型'
                   ),
                   autofocus: false,
                ),
                RaisedButton(
                    onPressed:(){},
                    child:Text('选择完毕')
                ),
               Text(
                 showText,
                 overflow: TextOverflow.ellipsis,
                 maxLines: 1,
               )
             ],
           ),
         ),
       ),
     );
  }

}