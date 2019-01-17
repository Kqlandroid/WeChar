
import 'package:flutter/material.dart';

class _Conversation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/icon_group_chat.png'),
          Container(width: 100.0,),
          Text('测试'),  Text('测试'),
        ],
      )
    );
  }
}

class ConversattionPage extends StatefulWidget {
  @override
  _ConversattionPageState createState() => _ConversattionPageState();
}

class _ConversattionPageState extends State<ConversattionPage> {
  @override
  Widget build(BuildContext context) {
    return _Conversation();
  }
}
