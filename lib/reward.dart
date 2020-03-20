import 'package:flutter/material.dart';
import 'package:food/components/RoundedContainer.dart';
import 'package:food/components/RoundImage.dart';
class Reward extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RewardWidget();
  }
  
}
 
class RewardWidget extends State<Reward>{
  
  Future<int> _showModalBottomSheet() {
    Size mSize = MediaQuery.of(context).size;
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return Stack(
      children: <Widget>[
        Container(
          height: 30.0,
          width: double.infinity,
          color: Colors.black54,
        ),
        RoundedContainer(
          topLeft: 20,
          topRight: 20,
          bottomLeft: 0,
          bottomRight: 0,
          color: Colors.white,
          height: 240,
          child: Column(
            children: <Widget>[
              RoundedContainer(
                color: Color(0xFFdddddd),
                height:50,
                width: mSize.width,
                topLeft: 20,
                topRight: 20,
                bottomLeft: 0,
                bottomRight: 0,
                alignment: Alignment.center,
                child: Text("邀请好友"),
              ),
              
              Row(
                children: <Widget>[
                  RoundImage(path: "asset/wx.png"),
                  RoundImage(path: "asset/dx.png"),
                  RoundImage(path: "asset/wx.png"),
                  RoundImage(path: "asset/wx.png"),
                ],
              ),
              Row(
                children: <Widget>[
                  RoundImage(path: "asset/wx.png"),
                  RoundImage(path: "asset/wx.png"),
                  RoundImage(path: "asset/dx.png"),
                ],
              )
            ],
          ),
        )
      ]);
    },
  );
}
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
                child: Image.asset("asset/yq.png"), 
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
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 70,
                        margin: EdgeInsets.fromLTRB(mSize.width*0.05, 20, mSize.width*0.05, 0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  width: mSize.width*0.5,
                                  // alignment: Alignment.center,
                                  child: Text("当前预计奖励",style: TextStyle(
                                    fontSize: 14,color: Color(0xFFaaaaaa)
                                  )),
                                ),
                                Container(
                                  width: mSize.width*0.5,
                                  child: Text("\$0",style: TextStyle(
                                    fontSize: 24,color: Color(0xFFff0000)
                                  )),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: mSize.width*0.3,
                                  // alignment: Alignment.center,
                                  child: Text("当前预计奖励",style: TextStyle(
                                    fontSize: 14,color: Color(0xFFaaaaaa)
                                  )),
                                ),
                                Container(
                                  width: mSize.width*0.3,
                                  child: Text("\$0",style: TextStyle(
                                    fontSize: 24,color: Color(0xFFff0000)
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height:40,
                        width: mSize.width*0.8,
                        child: Text("预计奖励为满足活动规则条件下的奖励预算,实际以结算奖励为主",style: TextStyle(
                          fontSize: 14,color: Color(0xFFaaaaaa)
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        width: mSize.width*0.8,
                        height:1,
                        color: Color(0xFFeeeeee),
                      ),
                      Container(
                        height:40,
                        width: mSize.width*0.8,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            Text("查看我的邀请"),
                          ],
                        ) 
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top:mSize.height*0.4,
                child: RoundedContainer(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.fromLTRB(mSize.width*0.05, 0, mSize.width*0.05, 0),
                  height:mSize.height*0.2 ,
                  width: mSize.width*0.9,
                  child: Column(
                    children: <Widget>[
                      Image.asset("asset/yq.png"), 
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child:FlatButton(
                              textColor: Colors.black,
                              highlightColor: Colors.blue[700],
                              colorBrightness: Brightness.dark,
                              child:Text("算算我的奖励"),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),side:BorderSide(color: Color(0xFFcccccc))),
                              onPressed: () {},
                            )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                            child: FlatButton(
                              color: Color(0xFFfc7946),
                              highlightColor: Colors.blue[700],
                              colorBrightness: Brightness.dark,
                              child:Text("立即邀请"),
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () async {
                                int type = await _showModalBottomSheet();
                                print(type);
                              },
                            ),
                          )
                          
                        ],
                      )
                    ],
                  ) 
                  
                ),
              )
            ],
          ),
      )
    );
    
  }
}