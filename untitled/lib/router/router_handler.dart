import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled/page/detail_page.dart';


Handler detailsHandler = Handler(
  handlerFunc:(BuildContext? context,Map<String,List<String>> params) {
     String? goodsId = params['id']?.first;
     print('detailsHandler${goodsId}');
     return DetailPage(detailId: '$goodsId');
  }
);


