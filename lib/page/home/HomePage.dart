import 'package:flutter/material.dart';
import 'package:flutter_module/common/app/System.dart';
import 'package:flutter_module/common/util/Number.dart';
import 'package:flutter_module/page/home/HomeTopDrawer.dart';
import 'package:flutter_module/widget/app/ScrollPage.dart';
import 'package:flutter_module/widget/component/AppBar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Widget _buildFriendItem() {
    final paddingSize = SysUtil.rpx(18);
    final contentHeight = SysUtil.rpx(100);
    final itemHeight = contentHeight + (paddingSize * 2);
    final layout = Row(
      children: [
        Container(
          width: itemHeight,
          height: itemHeight,
          child: Center(
            child: Container(
              width: contentHeight,
              height: contentHeight,
              color: Colors.blue,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: itemHeight,
            margin: EdgeInsets.only(right: paddingSize),
            padding: EdgeInsets.only(
              top: paddingSize,
              bottom: paddingSize,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );

    return Slidable(
      child: Container(
        child: layout,
        color: Colors.white,
      ),
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          caption: '置顶',
          color: Colors.black45,
          icon: Icons.more_horiz,
        ),
        IconSlideAction(
          caption: "删除",
          color: Colors.red,
          icon: Icons.account_tree_outlined,
        )
      ],
    );
  }

  bool isTopDrawerOpenState = false;
  double drawerHeaderHeight = 0;
  double drawerHeight = SysUtil.getScreenHeight() - SysUtil.rpx(200);

  Widget _buildPage() {
    final MAX_OFFSET = SysUtil.rpx(200); // 最大滚动距离
    final MIN_OFFSET = SysUtil.rpx(100); // 开始触发滚动效果
    final TOTAL_OFFSET = MAX_OFFSET - MIN_OFFSET; // 偏移的总数
    ScrollController scrollController;
    bool isTopDrawerOpen = false;

    return ScrollPage(
      onPointerUp: (e) {
        if (!isTopDrawerOpen) return;
//        scrollController.animateTo(-drawerHeight,
//            duration: Duration(milliseconds: 500), curve: Curves.ease);
//        Future.delayed(Duration(milliseconds: 450), () {
//          print("偏移量" + scrollController.offset.toString());
//          setState(() {
//            isTopDrawerOpenState = true;
//            drawerHeaderHeight = scrollController.offset;
//          });
//        });
      },
      scrollUpdate: (controller) {
        if (scrollController == null) {
          scrollController = controller;
        }
        final offset = controller.offset;
        if (offset <= -MIN_OFFSET) {
          // 控制外层下拉
          final scrollOffset = -(offset + MIN_OFFSET);
          final percent = NumUtil.percent(scrollOffset, TOTAL_OFFSET);
          isTopDrawerOpen = percent >= 100;
          topDrawerKey.currentState
              .setStateByPercent(NumUtil.percent(offset, drawerHeight));
        }
      },
      children: [
//        Container(
//          height: drawerHeight,
//          color: Colors.grey,
//        ),
        MyAppBar(title: "首页"),
        _buildFriendItem(),
        Container(height: 800, color: Colors.amber)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(child: _buildPage()),
        Positioned(child: HomeTopDrawer(key: topDrawerKey))
      ],
    );
  }
}
