// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
class Global {
  static var list = {
    "1":[
      {
       "pid":"1",
      "title":"大华全球永续企业",
      "profit":"10.56",
      "des1":"目标年化收益率",
      "time":"12个月",
      "asset":"平安内部资产",
      "start":"5000"
    },
    {
       "pid":"2",
      "title":"大华全球永续企业",
      "profit":"10.56",
      "des1":"目标年化收益率",
      "time":"12个月",
      "asset":"平安内部资产",
      "start":"2000"
    },
      {
      "pid":"3",
      "title":"大华全球永续企业",
      "profit":"10.56",
      "time":"12个月",
      "des1":"目标年化收益率",
      "asset":"平安内部资产",
      "start":"2000"
    },
    { 
      "pid":"4",
      "title":"联博低波幅股票",
      "profit":"3.64",
      "time":"12个月",
      "des1":"目标年化收益率",
      "asset":"平安内部资产",
      "start":"1000"
    },
    {
      "pid":"5",
      "title":"陆业宝",
      "profit":"4.60",
      "time":"12个月",
      "des1":"目标年化收益率",
      "asset":"平安内部资产",
      "start":"100"
    },
    {
      "pid":"6",
      "title":"陆业宝",
      "profit":"4.60",
      "time":"12个月",
      "des1":"目标年化收益率",
      "asset":"平安内部资产",
      "start":"2000"
    },
    {
      "pid":"7",
      "title":"大华全球永续企业",
      "profit":"10.56",
      "des1":"目标年化收益率",
      "asset":"平安内部资产",
      "start":"2000"
    },
    ],
    "2": [
      {
        "pid":"23",
        "title":"大华全球永续企业（活期）",
        "profit":"10.56",
        "time":"12个月",
        "des1":"目标年化收益率",
        "asset":"平安内部资产"
      },
      { 
        "pid":"24",
        "title":"联博低波幅股票（活期）",
        "profit":"3.64",
        "time":"12个月",
        "des1":"目标年化收益率",
        "asset":"平安内部资产"
      },
      {
        "pid":"25",
        "title":"陆业宝（活期）",
        "profit":"4.60",
        "time":"12个月",
        "des1":"目标年化收益率",
        "asset":"平安内部资产"
      },
      {
        "pid":"27",
        "title":"大华全球永续企业（活期）",
        "profit":"10.56",
        "des1":"目标年化收益率",
        "asset":"平安内部资产"
      },
    ],
    "3": [
      {
        "pid":"33",
        "title":"大华全球永续企业（转让）",
        "profit":"10.56",
        "time":"12个月",
        "des1":"目标年化收益率",
        "asset":"平安内部资产"
      },
      { 
        "pid":"34",
        "title":"联博低波幅股票（转让）",
        "profit":"3.64",
        "time":"12个月",
        "des1":"目标年化收益率",
        "asset":"平安内部资产"
      },
      {
        "pid":"35",
        "title":"陆业宝（转让）",
        "profit":"4.60",
        "time":"12个月",
        "des1":"目标年化收益率",
        "asset":"平安内部资产"
      }
    ]
  };
  // static SharedPreferences _prefs;
  static Future init() async {
    // _prefs = await SharedPreferences.getInstance();
  }
  static FindOne (String id,int sn){
    var one;
    for(var i=0;i<list[sn].length;i++){
      if(list[sn][i]["pid"] == id){
          one = list[sn][i];
      }
    }
    return one;
  }
  // static List<Widget> c = List<Widget>[];
}