import 'package:flutter/material.dart';
import 'package:flutter_module/widget/component/AppBar.dart';

class ScrollPage extends StatefulWidget {
  final MyAppBar appBar;
  final List<Widget> children;
  final PointerUpEventListener onPointerUp;
  final ScrollPhysics physics;

  final void Function(ScrollController) scrollUpdate;

  ScrollPage(
      {Key key,
      this.appBar,
      this.children,
      this.scrollUpdate,
      this.onPointerUp,
      this.physics})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScrollPage();
}

class _ScrollPage extends State<ScrollPage> {
  final GlobalKey _globalKey = new GlobalKey();
  double _topHeight = 0;
  ScrollController _scrollController = new ScrollController();

  Widget _buildBodyList() {
    if (widget.children == null) {
      return Container();
    }
    return Container(
      color: Colors.transparent,
      child: Listener(
        onPointerUp: (e) {
          if (widget.onPointerUp != null) {
            widget.onPointerUp(e);
          }
        },
        child: NotificationListener(
          onNotification: (Notification notification) {
            if (notification is ScrollUpdateNotification) {
              if (widget.scrollUpdate != null) {
                widget.scrollUpdate(_scrollController);
              }
            }
            if (notification is ScrollEndNotification) {
              if (_scrollController.position.extentAfter == 0) {
//              print('滚动到底部');
              }
              if (_scrollController.position.extentBefore == 0) {
//              print('滚动到头部');
              }
            }
            return true;
          },
          child: ListView.builder(
            controller: _scrollController,
            physics: widget.physics ?? BouncingScrollPhysics(),
            itemBuilder: (content, index) {
              return widget.children[index];
            },
            itemCount: widget.children.length,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _topHeight = _globalKey.currentContext.size.height;
      });
    });
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Scaffold(
          body: Stack(children: [
            Positioned(
                key: _globalKey,
                child: widget.appBar ?? Container(),
                top: 0,
                right: 0,
                left: 0),
            Positioned(
                child: _buildBodyList(),
                top: _topHeight,
                right: 0,
                left: 0,
                bottom: 0),
          ]),
        ));
  }
}
