import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Discover extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DiscoverWidget();
  }
  
}
 
class DiscoverWidget extends State<Discover>{
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
//   _openMapApp() async {
//      const url = 'geo:52.32,4.917'; //APP提供的schema
//      if (await canLaunch(url)) {
//           await (launch(url)); //安卓中打开
//      } else {
//           //iOS中打开
//           const url = 'https://192.168.31.248:1234/download';
//           if (await canLaunch(url)) {
//             await launch(url);
//           } else {
//             throw 'Could not launch $url';
//           }
//      }
// }
// _launchURL() async {
//   const url = 'https://192.168.31.248:1234/download';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("发现"), 
      ), 
      // body: WebviewScaffold(
      //   url: "https://192.168.31.248:1234/download",
      //   withZoom: true, //允许网页缩放
      // withLocalStorage: true,
      // withJavascript: true,
      // ),
    );
  }
  @override 
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}