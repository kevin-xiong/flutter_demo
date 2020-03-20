import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class Discover extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DiscoverWidget();
  }
  
}
 
class DiscoverWidget extends State<Discover>{
  _openMapApp() async {
     const url = 'geo:52.32,4.917'; //APP提供的schema
     if (await canLaunch(url)) {
          await (launch(url)); //安卓中打开
     } else {
          //iOS中打开
          const url = 'http://maps.apple.com/?ll=52.32,4.917';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
     }
}
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