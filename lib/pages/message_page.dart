import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../config/index.dart';

class MessagePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessagePageState();
  }

}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("消息"),
    );
  }

}

