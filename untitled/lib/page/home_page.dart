import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/data/service_method.dart';
import 'package:flutter_swiper/src/swiper.dart';
import 'package:flutter_swiper/src/swiper_pagination.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/router/application.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    //出初始化设计尺寸
    return Scaffold(
          appBar: AppBar(title: Text('首页')),
          body: FutureBuilder(
            future: getHomePageData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                List<Map> swiper = (data['data']['slides'] as List).cast();
                List<Map> gridList = (data['data']['type'] as List).cast();
                List<Map> goodsList =
                    (data['data']['recommend'] as List).cast();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SwipeDiy(swipeDataList: swiper),
                      TopNavigator(navigatorList: gridList),
                      GoodsRecommend(goodsRecommendList: goodsList),
                      GoodsRecommend2(goodsRecommendList: goodsList)
                    ],
                  ),
                );
              } else {
                return Center(
                    child: Text('加载数据',
                        style: TextStyle(
                            fontSize: 28)));
              }
            },
          ),
    );
  }
}

//首页轮播组件
class SwipeDiy extends StatelessWidget {
  final List swipeDataList;

  SwipeDiy({Key? key, required this.swipeDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swipeDataList[index]['image']}",
              fit: BoxFit.fill);
        },
        itemCount: swipeDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//商品类别导航
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({required this.navigatorList});

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
        Fluttertoast.showToast(msg: '点击了导航');
      },
      //FittedBox是为了解决溢出像素的问题，子view大于父view
      child: FittedBox (
        child: Column(
          children: [
              Image.network(item['image'], width: 60,fit: BoxFit.fill,),
              Text(item['name'])
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 15.0),
        child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 5,
            mainAxisSpacing: 12,
            children: navigatorList
               .map((item) => _gridViewItemUI(context, item))
               .toList()),
    );
  }
}

//商品推荐
class GoodsRecommend extends StatelessWidget {
  final List goodsRecommendList;

  GoodsRecommend({required this.goodsRecommendList});

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text('商品推荐', style: TextStyle(color: Colors.blue)),
    );
  }

  Widget _goodsItem(BuildContext context, item, index) {
    return InkWell(
      onTap: () {
          Application.router.navigateTo(context,"/detail?id=${index}");
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: FittedBox(
          child: Column(
            children: [
              Image.network(item['image'], width: 100),
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '${item['price']}元',
                    style: TextStyle(color: Colors.blue),
                    maxLines: 1,
                  ))
            ],
          ),
        )
      ),
    );
  }

  Widget _goodsList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: goodsRecommendList.length,
        itemBuilder: (context, index) {
          return _goodsItem(context, goodsRecommendList[index], index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [_titleWidget(), _goodsList(context)],
      ),
    );
  }
}

class GoodsRecommend2 extends StatelessWidget {
  final List goodsRecommendList;

  GoodsRecommend2({required this.goodsRecommendList});

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text('商品推荐', style: TextStyle(color: Colors.blue)),
    );
  }

  Widget _goodsItem(BuildContext context, item, index) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.fromLTRB(8, 25, 8, 8),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
          child: FittedBox(
            child: Column(
              children: [
                Image.network(item['image'], width: 100),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      '${item['price']}元',
                      style: TextStyle(color: Colors.blue),
                      maxLines: 1,
                    ))
              ],
            ),
          )),
    );
  }

  Widget _goodsList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: goodsRecommendList.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _goodsItem(context, goodsRecommendList[index], index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
           _goodsList(context)
        ],
      ),
    );
  }
}
