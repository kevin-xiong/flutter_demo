import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/rendering.dart';
import 'package:food/product.dart';
import 'package:food/common/global.dart';
import 'package:food/components/RoundedContainer.dart';

class Home extends StatefulWidget{
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomeWidget createState() => HomeWidget();

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   return HomeWidget();
  // }
}

class HomeWidget extends State<Home>{
  ScrollController _scrollController = new ScrollController();
  

  void _getPostData(bool _beAdd) async {

  }

  @override
  void initState() {
    super.initState();
    // 首次拉取数据
    _getPostData(true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _addMoreData();
        print('我监听到底部了!');
      }
    });
  }
  var posts =Global.list["1"];
  
  @override
  Widget build(BuildContext context) {
    Size mSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child:AppBar(
          elevation: 0,
          backgroundColor:Color(0xFF4557F3),
          brightness: Brightness.dark
        ),
        preferredSize: Size.zero
      ),
      body: new ListView(
        children: [
          new Stack(
            alignment: const FractionalOffset(1.3, 1.3),
            children: <Widget>[
              Container(
                color:Color(0xFF4557F3),
                height:220  
              ),
              Positioned(
                top:20, 
                left:mSize.width*0.1,
                child: new Container( 
                  alignment: Alignment.topCenter,
                  height:50, 
                  width:420,
                  child: Image.asset("asset/LU-Logo.png"), 
                ),
              ),
              Positioned(
                top:80.0, 
                left:mSize.width*0.1,
                height:50,
                width:280,
                child: Row(
                  children: <Widget>[
                    Container(
                    margin:EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width:120,
                    child:FlatButton(
                      color: Color(0xFFfc7946),
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      child:Text("登录"),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin:EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width:120,
                    child:FlatButton(
                      color: Color(0xFFfc7946),
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      child:  Text("注册"),
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () {},
                    ),
                  )
                  ]
                )
              ),
              new CarouselSlider(
                items: [1,2,3,4,5].map((i) {
                  return new Builder(
                    builder: (BuildContext context) {
                      return new RoundedContainer(
                        width: MediaQuery.of(context).size.width,
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:Image.network(
                            'https://lu-global-static.lufaxcdn.com/activity/img/20200306/15bda0ea-1e7c-4f8f-9a4b-e36f415c0348.jpg',
                            fit: BoxFit.fill,
                          )
                        ), 
                      );
                    },
                  );
                }).toList(),
                height: 110.0,
                autoPlay: true
            ),
          ]),
          Container( 
            margin: const EdgeInsets.fromLTRB(20,40,10,40),
            color: Colors.white,
            child: new StaggeredGridView.countBuilder(
              shrinkWrap:true,
              crossAxisCount: 4,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) => new RoundedContainer(
                margin: new EdgeInsets.all(5),
                child: index==0?
                  Container(
                    decoration: new BoxDecoration(
                        color: Color(0xFF4557F3), 
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white70,
                            offset: Offset(0.5, 0.5),
                            blurRadius: 0.3,
                            spreadRadius: 0.3,
                          )
                        ],
                    ),
                    child: Text('')
                  )
                  :GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => new Product(
                          pid:posts[index]["pid"]
                        )),
                      );
                    },
                    child:Column(
                      children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text('${posts[index]['title']}',style:  TextStyle(fontSize:20)),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child:Text('${posts[index]['profit']}',
                              style:  TextStyle(fontSize:40)
                            ),
                          ),
                          Container( 
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child:Text('${posts[index]['des1']}',style:  TextStyle(fontSize:10))
                          ),
                          Container(
                            height:1,
                            width:140,
                            color: Colors.black12,
                            margin: EdgeInsets.fromLTRB(0,0, 0, 0),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            alignment: Alignment.topLeft,
                            height:20,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child:Text('${posts[index]['asset']}', 
                                style:  TextStyle(fontSize:12,fontWeight:FontWeight.bold )
                            )
                          )
                      ], 
                      )
                  ),
              ), 
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index==0 ? 1 : 2),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
      
    );
  }
  
}