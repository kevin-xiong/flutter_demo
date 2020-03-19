import 'package:flutter/material.dart';
class RoundedContainer extends  StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  RoundedContainer({
    this.width,
    this.height:100,
    this.margin,
    this.alignment,
    this.padding,
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
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
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