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
  Ocr({
    Key key,
    @required this.pid,  // 接收一个text参数
  }) : super(key: key);
  final String pid;
  
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
              flex: 3,//flex用来设置当前可用空间的占优比
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
  Future getIDCardInfo(File file) async {
    showProgressDialog =true;//展示加载框
    Dio dio = new Dio();
    dio.options.contentType=ContentType.parse("multipart/form-data");
    var baseUrl = "https://api-cn.faceplusplus.com/cardpp/v1/ocridcard";

    final String targetPath = await getTempDir();
    File compressFile =await getCompressImage(file, targetPath);
    FormData formData = new FormData.from({
      "api_key": "TIpTmMSwPZjcw5fxSK9cYvdEwpn9f5Eo",
      "api_secret": "V_Fk1AYdK4-5kXJ7DDwndibG-B6UvFQI",
      "image_file": new UploadFileInfo(compressFile, "image_file")
    });
    Response<Map>  response;
    try {
      response =await dio.post<Map>(baseUrl,data:formData);
    } catch (e) {
      print(e);
      showProgressDialog =false;//隐藏加载框
      setState(() {});
    }
    showProgressDialog =false;//隐藏加载框
    setState(() {});
    if(response != null){
      print(response.data);
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
      restart = true;//展示重新拍照的提示
      setState(() {});
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
          getIDCardInfo(File(filePath));
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
  var targetPath = dir.absolute.path + "/temp.png";
  return targetPath;
}
Future<File> getCompressImage(File file, String targetPath) async {
  var path = file.absolute.path;
  var result = await FlutterImageCompress.compressAndGetFile(
    path, targetPath,
    quality: 88,
    rotate: 180,
  );

  print(file.lengthSync());
  print(result.lengthSync());
  return result;

}