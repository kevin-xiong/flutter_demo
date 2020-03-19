import 'package:flutter/material.dart';
import 'package:food/product.dart';
import "package:food/common/global.dart";
import 'package:food/components/RoundedContainer.dart';
class Invest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InvestWidget();
  }
  
}
 
class InvestWidget extends State<Invest>{
  var list =Global.list["1"];
  //TODO 用map会有问题
  Map<String,double> _height;
  double a = 0.0;
  double b = 0.0;
  double c = 0.0;
  TabController mController;
  var droplist = [
      {
        "title":"投资期限",
        "arr":["不限","3个月内","3-12个月","12个月以上"],
      },
      {
        "title":"起投额",
        "arr":["不限","1000以内","1000-5000","5000-10000","10000以上"],
      },
      {
        "title":"风险等级",
        "arr":["不限","R1","R2","R3","R4","R5"],
      }, 
    ];
  // List<Widget> _getListData(List arr){
  //   List<Widget> items=new List();
    
  //   for(var it =0;it<arr.length;it++){
  //     items.add(new Container(
  //       width: 80,
  //       child: new Text('${arr[it]}'),
  //     ));
  //   }
  //   return items;
  // }

  @override
  Widget build(BuildContext context) {
    final tabs = ["定期", "活期", "转让交易"];

    var duration = Duration(seconds: 1);
    Size mSize = MediaQuery.of(context).size;
    double mRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      backgroundColor: Color(0xFF4557F3),
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child:Column(
            children: [
              Container(
                margin:EdgeInsets.fromLTRB(50, 0, 50, 0),
                color: Color(0xFF4557F3),
                child: TabBar(
                  indicatorWeight: 4,
                  indicatorColor: Colors.white,
                  indicatorSize:TabBarIndicatorSize.label,
                  // labelPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  labelStyle: TextStyle(fontSize: 18),
                  tabs: tabs.map((t) {
                    return Tab(
                      child: Text(t),
                    );
                  }).toList(),
                  onTap: (index) {
                    print(index);
                    setState(() {
                      list = Global.list[(index+1).toString()];
                    });
                  },
                ),
              ),
              Expanded(
                child:TabBarView(
                controller: mController,
                children: 
                tabs.map((t) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.fromLTRB(50, 0, 50, 0),
                        color: Color(0xFF4557F3),
                        height:30,
                        child:Row(
                          children: droplist.map<Widget>((item) =>
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){ 
                                    setState(() {
                                      print(item['title']);
                                         if(item['title'] == "投资期限"){
                                           a = (a == 100.0)?0.0:100.0;
                                         }
                                         else if(item['title'] == "起投额"){
                                           b = (b == 100.0)?0.0:100.0;
                                         }
                                         else if(item['title'] == "风险等级"){
                                           c = (c == 100.0)?0.0:100.0;
                                         }
                                      });
                                  },
                                  child:Container(
                                    child: Text('${item['title']}'),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration:duration,
                                  height:item['title'] == "投资期限"?a:item['title'] == "起投额"?b:c, 
                                  child: Column(
                                    children: List<String>.from(item["arr"]).map<Widget>((ii) =>
                                      Container( 
                                        child:Text('${ii}'),
                                      )
                                    ).toList(),
                                  ) 
                                )
                              ],
                            )
                          ).toList()   
                        )
                      ),
                      new Stack(
                        // fit:StackFit.expand,
                        alignment: AlignmentDirectional.topStart,
                        children: <Widget>[
                          Container(
                              width: mSize.width,
                              color: Colors.green,
                              height:mSize.height*0.7444,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Color(0xFF4557F3),
                                    height:mSize.height*0.1,
                                  ),
                                  Expanded(
                                    child:Container(
                                      color: Colors.white,
                                    )
                                  )
                                ],
                              ),
                            ),
                          Positioned(
                            top: 30.0,
                            child: 
                          Container(
                            width: mSize.width*0.9,
                            margin:EdgeInsets.fromLTRB(mSize.width*0.05, 0, mSize.width*0.05, 0),
                            child: new ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: (){ 
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(builder: (context) => new Product(
                                          pid:list[index]["pid"]
                                        )),
                                      );
                                    },
                                    child:RoundedContainer( 
                                      height: 130,
                                      margin:EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      width: mSize.width*0.8,
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child:  Text('${list[index]['title']}',style:  TextStyle(fontSize:18)),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                width: mSize.width * mRatio * 0.1,
                                                margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                child:Text('${list[index]['profit']}%',style:  TextStyle(fontSize:28,fontWeight:FontWeight.bold))
                                              ),
                                              Container(
                                                width: mSize.width * mRatio * 0.1,
                                                alignment: Alignment.centerRight,
                                                margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                child: Text('${list[index]['time']}',style:  TextStyle(fontSize:18)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                width: mSize.width * mRatio * 0.1,
                                                margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                child:Text('${list[index]['des1']}',style:  TextStyle(fontSize:12))
                                              ),
                                              Container(
                                                width: mSize.width * mRatio * 0.1,
                                                margin:EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                alignment: Alignment.centerRight,
                                                child: Text('${list[index]['start']}起',style:  TextStyle(fontSize:18)),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    )
                                  );
                                }
                              )
                            ),     
                          )
                      ]),
                    ],
                  );
                }).toList()
              )
              )
            ] 
          )
        )
      )
    ); 
  }
}