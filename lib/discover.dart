import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';

class Discover extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DiscoverWidget();
  }
  
}
 
class DiscoverWidget extends State<Discover>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("发现"),
      ),
      body: Text("发现"),
    );
  }
}