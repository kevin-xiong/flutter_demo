import 'package:flutter/material.dart';
import 'package:food/mindex.dart';
import 'package:food/common/global.dart';


// void main() =>  Global.init().then((e) => {
//   runApp(MyApp());
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
// })
void main() => Global.init().then((e) => runApp(MyApp()));
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    ); 
  }

}





