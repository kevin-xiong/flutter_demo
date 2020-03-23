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
      decoration:new BoxDecoration(
          color: Color(0xFFf8f8f8),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      alignment: Alignment.topLeft,
      margin:EdgeInsets.all(5.0),
      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
      width: width,
      height: height,
      // color: Color(0xFFefefef),
      child: child
    );
  }
}