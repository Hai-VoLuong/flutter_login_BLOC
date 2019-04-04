import 'package:flutter/material.dart';
import 'package:login_bloc/theme.dart';

class CollasingListTitle extends StatefulWidget {
  final String title;
  final IconData icon;

  CollasingListTitle({@required this.title,@required this.icon});

  @override
  _CollasingListTitleState createState() => _CollasingListTitleState();
}

class _CollasingListTitleState extends State<CollasingListTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: <Widget>[
          Icon(widget.icon, color: Colors.white30, size: 38),
          SizedBox(width: 10),
          Text(widget.title ,style: listTitleDefaultTextStyle),
        ],
      ),
    );
  }
}