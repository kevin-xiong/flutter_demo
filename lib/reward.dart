import 'package:flutter/material.dart';
import 'package:food/components/RoundedContainer.dart';

class Reward extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RewardWidget();
  }
  
}
 
class RewardWidget extends State<Reward>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size mSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("奖励"),
      ),
      body: SafeArea(
          child:new Stack(
            children: <Widget>[
              Container(
                height:mSize.height,
                width: mSize.width,
                color: Colors.green,
                child: Text("")
              ),
              Positioned(
                top:mSize.height*0.2,
                child: Container(
                  color: Color(0xFFeeeeee),
                  width: mSize.width,
                  height:mSize.height*0.8,
                )
              ),
              Positioned(
                top:mSize.height*0.15,
                child: RoundedContainer(
                  height:mSize.height*0.2 ,
                  width: mSize.width*0.9,
                  margin: EdgeInsets.fromLTRB(mSize.width*0.05, 0, mSize.width*0.05, 0),
                  child: Text("我的奖励"),
                ),
              )
            ],
          ),
      )
    );
  }
}