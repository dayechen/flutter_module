import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module/common/app/System.dart';

class MyAppBar extends StatefulWidget {
  final String title;

  MyAppBar({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppBar();
}

class _AppBar extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    Text _buildTitleText(String title) {
      return Text(title, style: TextStyle(color: Colors.white, fontSize: 20));
    }

    return Container(
      color: Colors.blue,
      padding: EdgeInsets.fromLTRB(
          SysUtil.rpx(20),
          SysUtil.rpx(20) + SysUtil.getTopHeight(),
          SysUtil.rpx(20),
          SysUtil.rpx(20)),
      child: Stack(children: [
        Center(child: _buildTitleText(widget.title)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: Icon(Icons.arrow_back_ios, color: Colors.white)),
          ],
        )
      ]),
    );
  }
}
