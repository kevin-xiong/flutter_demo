import 'package:flutter/material.dart';
import 'package:food/home.dart';
import 'package:food/invest.dart';
import 'package:food/reward.dart';
import 'package:food/discover.dart';
import 'package:food/account.dart';
import 'package:camera/camera.dart';

class Main extends StatefulWidget{
  final CameraDescription camera;
  const Main({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainWidget();
  }

}

class MainWidget extends State<Main>{

  int _index=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack( 
        children: <Widget>[
          Home(),
          Invest(),
          Reward(),
          Discover(camera:widget.camera),
          Account()
        ],
        index: _index,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar( // 底部导航
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.monetization_on), title: Text('投资')),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), title: Text('奖励')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('发现')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('账户')),
          ],
          currentIndex: _index,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
          unselectedItemColor:Colors.grey,
          showUnselectedLabels:true,
          type: BottomNavigationBarType.fixed,
        )
      )
    );
  }
    void _onItemTapped(int index) {
      setState(() {
        _index = index;
      });
    }
}