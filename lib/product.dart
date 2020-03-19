import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/services.dart';
import 'package:food/price.dart';
import 'package:food/common/global.dart';

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
        title: Text(widget.pid),
      ),
      body: SafeArea( 
        child:new ListView( 
          children: [
            Container(
              child: Text(
                Global.FindOne(widget.pid,1)['title']
              ) ,
            ),
            FlatButton(
              color: Color(0xFFfc7946),
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              child:Text("投资"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Price(
                    pid:widget.pid
                  )),
                );
              },
            ),
          ]
        )
      )
    );
  }
}