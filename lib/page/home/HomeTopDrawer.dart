import 'package:flutter/material.dart';

GlobalKey<_HomeTopDrawerState> topDrawerKey = new GlobalKey();

class HomeTopDrawer extends StatefulWidget {
  HomeTopDrawer({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeTopDrawerState();
}

class _HomeTopDrawerState extends State<HomeTopDrawer> {

  void setStateByPercent(double percent) {
//    print("滚动的进度条" + percent.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.grey,
      child: Center(child: Text("这里是内容")),
    );
  }
}
