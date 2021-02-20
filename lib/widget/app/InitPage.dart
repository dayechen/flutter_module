import 'package:flutter/material.dart';
import 'package:flutter_module/common/app/System.dart';
import 'package:flutter_module/page/home/HomePage.dart';
import 'package:flutter_module/widget/app/ScrollPage.dart';
import 'package:flutter_module/widget/popup/popup.dart';

class InitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InitPage();
}

class _InitPage extends State<InitPage> {
  int _currentIndex = 0;

  List<Widget> pages() {
    return [HomePage(), ScrollPage()];
  }

  List<BottomNavigationBarItem> _buildItemList() {
    return [
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.home, color: Colors.blue),
          icon: Icon(Icons.home_outlined, color: Colors.black12),
          label: "首页"),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.home, color: Colors.blue),
          icon: Icon(Icons.home_outlined, color: Colors.black12),
          label: "详情"),
    ];
  }

  Widget _buildInitPage() {
    return Scaffold(
      body: pages()[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _buildItemList(),
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SysUtil.init(context);
    return Stack(
      children: [
        Positioned(child: _buildInitPage()),
//        Positioned(child: Popup(), top: 0, right: 0, bottom: 0, left: 0),
      ],
    );
  }
}
