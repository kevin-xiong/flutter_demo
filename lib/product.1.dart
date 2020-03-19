import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';

class Product extends StatefulWidget{
  Product({
    Key key,
    @required this.pid,  // 接收一个text参数
  }) : super(key: key);
  final String pid;
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductWidget();
  }
  
}
 
class ProductWidget extends State<Product>{
  var t = "单品页";
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(t),
      ),
      body: Text(t),
    );
  }
}