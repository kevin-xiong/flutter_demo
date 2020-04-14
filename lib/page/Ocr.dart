import 'dart:async';
import 'dart:io';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:camera/camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'dart:convert' as convert;

bool showProgressDialog = false;
bool restart = false;
var photoPath = null;
class IDCardIdentifyResult{
   static final String name = "name";
   static final String gender= "gender";
   static final String id_card_number= "id_card_number";
   static final String birthday= "birthday";
   static final String race= "race";
   static final String address= "address";
   static final String side= "side";
   static final String  valid_date= "valid_date";
   static final String  issued_by= "issued_by";
}
class Ocr extends StatefulWidget{
  final String pid;
  final CameraDescription camera;
  Ocr({
    Key key,
    @required this.pid,
    @required this.camera,
  }) : super(key: key);
  
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OcrWidget();
  }
  
}
 
class OcrWidget extends State<Ocr>{
  
  var t = "ocr";
  CameraController controller;
  VideoPlayerController videoController;
  VoidCallback videoPlayerListener;
  WidgetsBinding widgetsBinding;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  bool isDetecting = false;
  @override
  void initState() {
    super.initState();
    onNewCameraSelected(widget.camera);
  }
  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
      controller.startImageStream((CameraImage img) async {
        if (!isDetecting) {
          var bytesList =img.planes.map((plane) {
                  return  plane.bytes;
                }).toList();
          print(img.planes.length);
          List<int> bytesList1 =img.planes[0].bytes;
          List<int> bytesList2 =img.planes[1].bytes;
          List<int> bytesList3 =img.planes[2].bytes;
          // bytesList1.addAll(bytesList2);
          // bytesList1.addAll(bytesList3);
          // var buffer = new byteData.buffer;
// var bytes = new ByteData.view(buffer);
          // List<int> imbyte = List.from(byteData);
          File fl = await writeJPG(bytesList1);
          // getIDCardInfo(bytesList1);
// ByteBuffer Y = ByteBuffer.wrap(bytesList.get(0));
// ByteBuffer U = ByteBuffer.wrap(bytesList.get(1));
// ByteBuffer V = ByteBuffer.wrap(bytesList.get(2));

// int Yb = Y.remaining();
// int Ub = U.remaining();
// int Vb = V.remaining();

// byte[] data = new byte[Yb + Ub + Vb];

// Y.get(data, 0, Yb);
// V.get(data, Yb, Vb);
// U.get(data, Yb + Vb, Ub);

// Bitmap bitmapRaw = Bitmap.createBitmap(imageWidth, imageHeight, Bitmap.Config.ARGB_8888);
// Allocation bmData = renderScriptNV21ToRGBA888(
//     mRegistrar.context(),
//     imageWidth,
//     imageHeight,
//     data);
// bmData.copyTo(bitmapRaw);
          isDetecting = true;

            // isDetecting = false;
        }
      });
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }
  Future<File> writeJPG(List<int> sourceBytes) async{
      try {
          final File file = await localFile(await localPath());
          file.writeAsBytesSync(sourceBytes);
          print(file.path);
          return file;
      }
      catch (err) {
          print(err);
      }
  }
  localFile(path) async {
      return new File('$path/scantemp2.jpg');
  }
  localPath() async {
      try {
          var tempDir = await getTemporaryDirectory();
          String tempPath = tempDir.path;

          var appDocDir = await getApplicationDocumentsDirectory();
          String appDocPath = appDocDir.path;
          
          print('临时目录: ' + tempPath);
          print('文档目录: ' + appDocPath);
          return appDocPath;
      }
      catch(err) {
          print(err);
      }
  }
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return new Container(
        width:double.infinity,
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller),
        ),
      );
    }
  }

Widget _cameraFloatImage(){
    return new Positioned(
        child: new Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(50, 50, 50, 50),
          child:new Image.asset('assets/images/bg_identify_idcard.png'),
        ));
  }
Widget _takePictureLayout(){
    return new Align(
        alignment: Alignment.bottomCenter,
        child: new Container(
          color: Colors.blueAccent,
          alignment: Alignment.center,
          child:  new IconButton(
            iconSize: 50.0,
            onPressed: controller != null &&
                controller.value.isInitialized &&
                !controller.value.isRecordingVideo
                ? onTakePictureButtonPressed
                : null,
            icon: Icon(
              Icons.photo_camera,
              color: Colors.white,
            ),
          ),
        ));
  }
Widget getPhotoPreview(){
  if( null != photoPath){
    return new Container(
      width:double.infinity,
      height: double.infinity,
      color: Colors.black,
      alignment: Alignment.center,
      child: Image.file(File(photoPath)),
    );
  }else{
    return new Container(
      height: 1.0,
      width: 1.0,
      color: Colors.black,
      alignment: Alignment.bottomLeft,
    );
  }
  
}
Widget getProgressDialog(){
  if(showProgressDialog){
    return new Container(
      color: Colors.black12,
      alignment: Alignment.center,
      child: SpinKitFadingCircle(color: Colors.blueAccent),
    );
  }else{
    return new Container(
      height: 1.0,
      width: 1.0,
      color: Colors.black,
      alignment: Alignment.bottomLeft,
    );
  }
}
Widget getRestartAlert(){
    if(restart){
      return new Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
            children: <Widget>[
              new Text(
                "身份证识别失败，重新采集识别?",
                style: TextStyle(color: Colors.black26,fontSize: 18.0),
              ),
              IconButton(
                icon: Icon(
                  Icons.subdirectory_arrow_right,
                  color: Colors.blueAccent,
                ),
                onPressed:toRestartIdentify() ,),
            ]
        ),
      );
    }else{
      return new Container(
        height: 1.0,
        width: 1.0,
        color: Colors.black,
        alignment: Alignment.bottomLeft,
      );
    }
  }
@override
Widget build(BuildContext context) {
  
  return Scaffold(
    key: _scaffoldKey,
    body: new Container(
        color: Colors.black,
        child:new Stack(children: <Widget>[
          new Column(children: <Widget>[
            Expanded(
              flex: 5,//flex用来设置当前可用空间的占优比
              child:  new Stack(children: <Widget>[
                _cameraPreviewWidget(),//相机视图
                _cameraFloatImage(),//悬浮的身份证框图
              ]),
            ),
            Expanded(
              flex: 1,//flex用来设置当前可用空间的占优比
              child:_takePictureLayout(),//拍照操作区域布局
            ),
          ],),
          getPhotoPreview(),//图片预览布局
          getProgressDialog(),//数据加载中提示框
          getRestartAlert(),// 身份证识别失败，重新拍照的提示按钮
        ]),
      )
    );
  }
  Future getIDCardInfo(List<int> bytesCont) async {
    print("getIDCardInfo");
    print("file");
    showProgressDialog =true;//展示加载框
    Dio dio = new Dio();
    dio.options.contentType=ContentType.parse("multipart/form-data");
    var baseUrl = "https://api-cn.faceplusplus.com/cardpp/v1/ocridcard";

    final String targetPath = await getTempDir();
    // File compressFile =await getCompressImage(file, targetPath);
    print(bytesCont.length);
    UploadFileInfo uimage = new UploadFileInfo.fromBytes(bytesCont, "image_file",contentType:ContentType('image', 'jpg'));
    print(uimage.bytes);
    FormData formData = new FormData.from({
      "api_key": "TIpTmMSwPZjcw5fxSK9cYvdEwpn9f5Eo",
      "api_secret": "V_Fk1AYdK4-5kXJ7DDwndibG-B6UvFQI",
      "image_file": uimage
    });
    Response<Map>  response;
    // print(formData);
    try {
      response =await dio.post<Map>(baseUrl,data:formData);
    } catch (e) {
      print(e);
      const timeout = const Duration(seconds: 3);
      print('currentTime='+DateTime.now().toString());
      Timer(timeout, () {
        //到时回调
        isDetecting = true;
      });
      // showProgressDialog =false;//隐藏加载框
      // setState(() {});
    }
    // showProgressDialog =false;//隐藏加载框
    print(response);
    // setState(() {});
    if(response != null){
      
      Map<String,Object> resultMap = response.data;
      List<dynamic> cards =resultMap['cards'];
      if(cards != null && !cards.isEmpty){
        Map<String,dynamic> card = cards[0];
        Navigator.pop(context, card);
        var idcard = card[IDCardIdentifyResult.id_card_number];
        var name = card[IDCardIdentifyResult.name];
        var birth = card[IDCardIdentifyResult.birthday];
        var address = card[IDCardIdentifyResult.address];
        print('身份证号： ${idcard}');
        print('姓名： ${name}');
        print('出生日期： ${birth}');
        print('地址： ${address}');
      }else{
        restart = true;//展示重新拍照的提示
        setState(() {});
      }
    }else{
      // restart = true;//展示重新拍照的提示
      // setState(() {});
    }
  }
  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          videoController = null;
          videoController?.dispose();
        });
        if (filePath != null) {
          //showInSnackBar('Picture saved to $filePath');
          photoPath = filePath;
          setState(() { });
          // getIDCardInfo(File(filePath));
        }
      }
    });
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      print('Error: select a camera first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      print(e);
      return null;
    }
    return filePath;
  }
  toRestartIdentify(){
    restart = true;
    photoPath = null;
    setState(() {});
    restart = false;
  }
}
Future<String> getTempDir() async {
  var dir = await path_provider.getTemporaryDirectory();
  var targetPath = dir.absolute.path + "/temp.jpg";
  return targetPath;
}
Future<File> getCompressImage(File file, String targetPath) async {
  var path = file.absolute.path;
  
  var result = await FlutterImageCompress.compressAndGetFile(
    path, targetPath,
    quality: 88,
    rotate: 180,
  );
  return result;

}