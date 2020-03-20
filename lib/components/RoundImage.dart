import 'package:flutter/material.dart';
class RoundImage extends  StatelessWidget {
  final double radius;
  final String path;
  RoundImage({
    this.radius:25,
    this.path,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: CircleAvatar(
        //头像半径
        radius: radius,
        backgroundColor:Colors.white,
        //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
        backgroundImage: AssetImage(path),
      )
    );
  }
}