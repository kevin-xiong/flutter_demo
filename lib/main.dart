import 'package:flutter/material.dart';
import 'package:food/mindex.dart';
import 'package:food/common/global.dart';
import 'package:camera/camera.dart';

// void main() =>  Global.init().then((e) => {
//   runApp(MyApp());
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
// })
// void main () => Global.init().then((e) => runApp(MyApp()));
List<CameraDescription> cameras;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
	// 获取到可用的camera
  cameras = await availableCameras();
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(
        camera:cameras[0]
      ),
    ); 
  }

}





