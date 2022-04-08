import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:untitled/data/service_method.dart';
import 'home_page.dart';

class CategoryPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CategoryPageState();
  }
}

class _CategoryPageState extends State<CategoryPage>  {

  String homePageContent = '正在获取数据';
  int page = 0;
  //EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    getHomePageData().then((value) {
      setState(() {
        homePageContent = value.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if('正在获取数据' == homePageContent) {
       return Center(child: Text(homePageContent));
    } else {
      var data = json.decode(homePageContent);
      List<Map> swiper = (data['data']['slides'] as List).cast();
      List<Map> gridList = (data['data']['type'] as List).cast();
      List<Map> goodsList = (data['data']['recommend'] as List).cast();
      return EasyRefresh(
        // enableControlFinishRefresh: true,
        // enableControlFinishLoad: true,
        // controller: _controller,
        child: GoodsRecommend2(goodsRecommendList:goodsList),
        onLoad: () async {
          print('开始加载更多');
          if (page <= 15) {
            setState(() {
              Map map = new Map();
              map.putIfAbsent('price', () =>'新价格');
              map.putIfAbsent('image', () => "https://note.youdao.com/yws/api/personal/file/WEBb3820c3ffd218a0654199cade6ccc03a?method=download&shareKey=652233836293b119d0a5c1b18b215cbe");
              goodsList.add(map);
              page++;
             // _controller.finishLoad(success:true,noMore:false);
              print('加载完成');
            });
          } else {
             print('else 加载完成');
             //_controller.finishLoad(success:true,noMore:true);
          }
        },
        onRefresh : () async {
            setState(() {
              print('else 刷新完成');
              //_controller.finishRefresh(success:true,noMore:false);
            });
          }
      );
    }
  }

  Widget _goodsItem(BuildContext context, item, index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 150,
        width: 150,
        padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
            Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: [
            Image.network(item['image'], width: 150),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  '${item['price']}元',
                  style: TextStyle(color: Colors.blue),
                  maxLines: 1,
                ))
          ],
        ),
      ),
    );
  }
}
//List<Map> goodsList = (data['data']['recommend'] as List).cast();
//getHomePageData()
//GoodsRecommend2(goodsRecommendList:goodsList)