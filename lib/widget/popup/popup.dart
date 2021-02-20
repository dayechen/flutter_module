import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              color: Colors.black,
            ),
          ),
          Container(
            color: Colors.white,
            child: Text("这里是弹框"),
          )
        ],
      ),
    );
  }
}
