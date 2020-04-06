import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;
import 'package:http/http.dart' as http;

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  void getFuture() async {
    Map data = await getResponse(utils.defaultLocation, utils.appId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Klimatic"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: () => debugPrint("Hey you pushed me!"))
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
              child: new Image.asset('images/umbrella.png',
                height: 490.0,
                fit: BoxFit.fill,)
          ),
          new Container(
            alignment: Alignment.topRight,
            margin: new EdgeInsets.fromLTRB(0, 10.0, 30.0, 0),
            child: new Text(utils.defaultLocation,
              style: cityStyle(),),
          ),
          new Center(
            child: new Image.asset('images/light_rain.png'),
          ),
          new Container(
            margin: new EdgeInsets.fromLTRB(15, 270, 0, 0),
            child: new Text("${"67.9F"}",
              style: tempStyle(),),
          )
        ],
      ),
    );
  }
}

Future<Map> getResponse(String city, String appId) async{
  http.Response theResponse = await http.get("http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$appId");
  return json.decode(theResponse.body);
}

TextStyle cityStyle(){
  return new TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w300,
      fontSize: 19.0
  );
}

TextStyle tempStyle(){
  return new TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 45.0
  );
}