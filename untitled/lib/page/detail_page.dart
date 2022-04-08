import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailPage extends StatelessWidget {

  final String detailId;

  DetailPage({required this.detailId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('详情页${detailId}'),
        // 加载html数据的页面
        // child: Html(
        //   data: ,
        // ),
      ),

    );
  }
}
