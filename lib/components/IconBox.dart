import 'package:flutter/material.dart';
class IconBox extends  StatelessWidget {
  final List<Widget> children;
  IconBox({
    @required this.children
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height:100,
      alignment:Alignment.bottomCenter,
      decoration:BoxDecoration(
        border: new Border.all(width: 0.2, color: Colors.blue),
      ),
      child: Column(
        children: children,
      )
    );
  }
}