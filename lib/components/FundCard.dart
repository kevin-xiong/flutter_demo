import 'package:flutter/material.dart';
class FundCard  extends  StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  FundCard ({
    this.width:100,
    this.height:50,
    @required this.child
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin:EdgeInsets.all(5.0),
      width: width,
      height: height,
      color: Color(0xFFefefef),
      child: child
    );
  }
}