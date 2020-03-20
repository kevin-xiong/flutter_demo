import 'package:flutter/material.dart';
class RoundedContainer extends  StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color color;
  final double radius;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  RoundedContainer({
    this.width,
    this.height:100,
    this.margin,
    this.alignment,
    this.padding,
    this.color:Colors.white,
    this.radius:10.0,
    this.topLeft:10.0,
    this.topRight:10.0,
    this.bottomLeft:10.0,
    this.bottomRight:10.0,
    @required this.child
  });
  @override
  Widget build(BuildContext context) {
    return Container( 
      height: height,
      margin:margin,
      width: width,
      alignment:alignment,
      padding:padding,
      decoration:new BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            ),
          boxShadow: [
            BoxShadow( 
              color: Colors.black12,
              offset: Offset(1, 1),
              blurRadius: 5,
              spreadRadius: 0.3,
            )
          ],
      ),
      
      child:child
    );
  }
}