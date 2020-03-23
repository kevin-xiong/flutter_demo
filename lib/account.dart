import 'package:flutter/material.dart';
import 'package:food/components/RoundedContainer.dart';
import 'package:food/components/RoundImage.dart';
// import 'package:food/components/IconBox.dart';
import 'package:food/components/Chart.dart';
import 'package:food/components/FundCard.dart';
class Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AccountrWidget();
  }
  
}
 
class AccountrWidget extends State<Account>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size mSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF4557F3),
      body: SafeArea(
          child:new Stack( 
            children: <Widget>[
              Container(
                height:mSize.height,
                width: mSize.width,  
                color: Color(0xFF4557F3),
              ),
              Positioned(
                child: Container(
                  margin:EdgeInsets.fromLTRB(mSize.width*0.05, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.format_align_left,color: Colors.white,size: 35.0),
                      RoundImage(path: "asset/LU-Logo.png",radius: 20.0,),
                    ],
                  )
                ),
              ),
              Positioned(
                top:mSize.height*0.17,
                child: Container(
                  color: Color(0xFFeeeeee),
                  width: mSize.width,
                  height:mSize.height*0.8,
                )
              ),
              Positioned(
                top:mSize.height*0.1,
                child: Container(
                  margin: EdgeInsets.fromLTRB(mSize.width*0.1, 0, mSize.width*0.1, 0),
                  width: mSize.width*0.8,
                  height:mSize.height*0.05,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // Alignment(x,y)  (0,0) 是由 rectangle 中心点计算的
                      begin: Alignment(-1.0, 0.0),
                      end: Alignment(0.0, 1.0),
                      colors: <Color>[
                        Color(0xFF87CEEB),
                        Color(0xFF22D3FF),
                        Color(0xFF00B1DD),
                      ],
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(10.0),
                      topRight: Radius.circular(10.0)
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
                  child: Container(
                    margin:EdgeInsets.fromLTRB(mSize.width*0.05, 0, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.ac_unit,color: Colors.white,size: 20.0),
                        
                        Text("钻石")
                      ],
                    ),
                  )
                )
              ),
              Positioned(
                top:mSize.height*0.145,
                child: Container(
                  margin: EdgeInsets.fromLTRB(mSize.width*0.05, 0, mSize.width*0.05, 0),
                  width: mSize.width*0.9,
                  child: RoundedContainer(
                    height: mSize.height*0.5,
                    child: Column(
                        children: <Widget>[ 
                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width:mSize.width*0.4,
                                    margin: EdgeInsets.fromLTRB(mSize.width*0.05, 10, 0, 0),
                                    child: Text("总资产",style: TextStyle(
                                      fontSize: 18
                                    )),
                                  ),
                                  Container(
                                    height: 70,
                                    width:mSize.width*0.4,
                                    margin: EdgeInsets.fromLTRB(mSize.width*0.05, 10, 0, 0),
                                    child: Text("0",style: TextStyle(
                                      fontSize: 40
                                    )),
                                  )
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 30,
                                    width:mSize.width*0.3,
                                    margin: EdgeInsets.fromLTRB(mSize.width*0.05, 10, 0, 0),
                                    child: Text("累计收益",style: TextStyle(
                                      fontSize: 18
                                    )),
                                  ),
                                  Container(
                                    height: 70,
                                    width:mSize.width*0.3,
                                    margin: EdgeInsets.fromLTRB(mSize.width*0.05, 10, 0, 0),
                                    child: Text("0",style: TextStyle(
                                      fontSize: 40
                                    )),
                                  )
                                ],
                              )
                            ],
                          ),
                          Container(
                            height:1,
                            width:mSize.width*0.8,
                            color: Color(0xFFdddddd),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: mSize.width*0.54,
                                child: SizedBox(width:180.0,height: 180.0, 
                                  child: Chart.withSampleData()
                                ),
                              ),
                                Column(
                                  children: <Widget>[
                                    FundCard(
                                      width: mSize.width*0.3,
                                      height:mSize.width*0.13,
                                      child: Column(
                                        children: <Widget>[
                                          Text("余额"),
                                          Text("0.00")
                                      ])
                                    ),
                                    FundCard(
                                      width: mSize.width*0.3,
                                      height:mSize.width*0.13,
                                      child: Column(
                                        children: <Widget>[
                                          Text("定期"),
                                          Text("0.00")
                                      ])
                                    ),FundCard(
                                      width: mSize.width*0.3,
                                      height:mSize.width*0.13,
                                      child: Column(
                                        children: <Widget>[
                                          Text("活期"),
                                          Text("0.00")
                                      ])
                                    ),FundCard(
                                      width: mSize.width*0.3,
                                      height:mSize.width*0.13,
                                      child: Column(
                                        children: <Widget>[
                                          Text("特别计划"),
                                          Text("0.00")
                                      ])
                                    )
                                  ],
                              ),
                            ],
                          ),
                          Container(
                            height:1,
                            width:mSize.width*0.8,
                            color: Color(0xFFdddddd),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child:FlatButton(
                                  color: Color(0xFFBDF0FD),
                                  colorBrightness: Brightness.dark,
                                  textColor:Color(0xFF0000DD),
                                  child:Container(
                                    alignment: Alignment.center,
                                    width:100,
                                    child:Text("取现")
                                  ),
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child:FlatButton(
                                  color: Color(0xFFBDF0FD),
                                  textColor:Color(0xFF0000DD),
                                  colorBrightness: Brightness.dark,
                                  child:Container(
                                    alignment: Alignment.center,
                                    width:100,
                                    child:Text("充值")
                                  ),
                                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                  ),
                )
              ),
              Positioned(
                top:mSize.height*0.65,
                child: Column(
                  children: <Widget>[
                    RoundedContainer(
                      margin: EdgeInsets.fromLTRB(mSize.width*0.05, 20, mSize.width*0.05, 0),
                      height:60,
                      width: mSize.width*0.9,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child:Icon(Icons.crop,color: Colors.blue),
                          ),
                          Text("续投计划",style:TextStyle(fontSize: 18))
                        ],
                      )
                    ),
                    RoundedContainer(
                      margin: EdgeInsets.fromLTRB(mSize.width*0.05, 20, mSize.width*0.05, 0),
                      height:60,
                      alignment: Alignment.center,
                      width: mSize.width*0.9,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20,0 ),
                            child:Icon(Icons.confirmation_number,color: Colors.red,)
                          ),
                          Text("投资券",style:TextStyle(fontSize: 18))
                        ],
                      )
                    )
                  ]
                ),
              )
              
            ],
          )
      )
    );
  }
}