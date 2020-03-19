import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
import 'package:food/home.dart';

class Result extends StatefulWidget{
  Result({
    Key key,
    @required this.pid,  // 接收一个text参数
  }) : super(key: key);
  final String pid;
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResultWidget();
  }
  
}
 
class ResultWidget extends State<Result>{
  var t = "结果页";
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(t),
      ),
      body:SafeArea( 
        child:new ListView( 
          children: [
            Container(
              child: Text("data"),
            ),
            FlatButton(
              color: Color(0xFFfc7946),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              child:Text("回首页"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Home()),
                );
              },
            ),
          ]
        )
      ),
    );
  }
}