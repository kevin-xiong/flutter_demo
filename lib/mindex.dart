import 'package:flutter/material.dart';
import 'package:food/home.dart';
import 'package:food/invest.dart';
import 'package:food/reward.dart';
import 'package:food/discover.dart';
import 'package:food/account.dart';

class Main extends StatefulWidget{
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
          Discover(),
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
            BottomNavigationBarItem(icon: Icon(Icons.money_off), title: Text('投资')),
            BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), title: Text('奖励')),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('发现')),
            BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('账户')),
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