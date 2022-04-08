import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MemberPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MemberPageState();
  }
}


class MemberPageState extends State<MemberPage> {

  late EasyRefreshController _controller;

  // 条目总数
  int _count = 20;
  // 这种解决方案不好，要在很多方案维护这个变量
  bool _isNoMore = false;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("EasyRefresh")
      ),
      body: EasyRefresh.custom(
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controller,
        header: ClassicalHeader(),
        //footer: _count >= 40 ? NoMoreFooter() : ClassicalFooter(),
        footer: ClassicalFooter(noMoreText: '已经到底了~'),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            print('onRefresh');
            setState(() {
              _count = 20;
              _isNoMore = false;
            });
            _controller.resetLoadState();
          });
        },
        onLoad: !_isNoMore ? () async {
          await Future.delayed(Duration(seconds: 1), () {
            print('onLoad');
            setState(() {
              _count += 10;
            });
            _controller.finishLoad(noMore: _count >= 40);
            if(_count >= 40) {
              //解决底部footer显示不回弹的问题，这种延时解决是否是最好的方案
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  _isNoMore= true;
                });
              });
            }
          });
        }:null,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  width: 60.0,
                  height: 60.0,
                  child: Center(
                    child: Text('$index'),
                  ),
                  color:
                  index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                );
              },
              childCount: _count,
            ),
          ),
        ],
      ),
        persistentFooterButtons: <Widget>[
          FlatButton(
              onPressed: () {
                _controller.callRefresh();
              },
              child: Text("Refresh", style: TextStyle(color: Colors.black))),
          FlatButton(
              onPressed: () {
                _controller.callLoad();
              },
              child: Text("Load more", style: TextStyle(color: Colors.black))),
        ]);
  }

}

class NoMoreFooter extends Footer {

  @override
  Widget contentBuilder(BuildContext context, LoadMode loadState, double pulledExtent, double loadTriggerPullDistance, double loadIndicatorExtent, AxisDirection axisDirection, bool float, Duration? completeDuration, bool enableInfiniteLoad, bool success, bool noMore) {
     return Center(child: Text('没有更多了'));
  }

}