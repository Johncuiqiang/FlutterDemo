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
      //  header: ClassicalHeader(),
      //  footer: ClassicalFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            print('onRefresh');
            setState(() {
              _count = 20;
            });
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            print('onLoad');
            setState(() {
              _count += 10;
            });
           // _controller.finishLoad(noMore: _count >= 40);
          });
        },
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