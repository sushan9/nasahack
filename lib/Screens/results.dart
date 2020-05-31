
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
String i;
bool loading =true;
List userData;

Future<String> _getData() async {
var response = await http.get("https://fsocietyspaceapp.herokuapp.com/api/?username=nirjalpaudel&password=n1_rjal9841&name=Nirjal+Paudel&date-to-predict=2020-07-12&place=Kathmandu");
var getData = json.decode(response.body);
if (this.mounted)
setState(() {
loading = false;
userData = [getData];
});
}

// @override
// void initState() {
//   super.initState();
//  // getData();
// }

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text("Crop Growth Prediction"),
backgroundColor: Colors.green,
actions: <Widget>[
IconButton(icon: Icon(Icons.refresh), onPressed: (){
_getData();
}
),
],
),
body: ListView(
padding: EdgeInsets.all(10.0),
children: <Widget>[
loading ? Center(child: CircularProgressIndicator()):
ListView.builder(
shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
itemCount: userData == null ? 'Empty' : userData[0]["cropsinfo"].length,
itemBuilder:(context,i){
return cropdata(i);
}
)
],

)
);
}
Widget cropdata(int i ){
return Column(
children:<Widget>[
Image(image: AssetImage('img/wheat.jpeg')),
Center(child: Text(userData[0]["cropsinfo"][i]["name"],style: TextStyle(
fontSize:20.0,fontWeight:FontWeight.bold
),)
),
SizedBox(height:10.0),

Row(
children: <Widget>[
Expanded(
child: Container(
color:Colors.red,
//color:Colors.blue,
padding:EdgeInsets.all(20.0),
child: Column(
children: <Widget>[
Text(userData[0]["cropsinfo"][i]["maxtemp"].toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
Image(image: AssetImage('img/wheat.jpeg')),
Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
Text('maxtemp',style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold),)
],
),
),
),
Padding(padding:EdgeInsets.all(10.0)),
Expanded(
child: Container(
color:Colors.green,
padding:EdgeInsets.all(20.0),
child: Column(
children: <Widget>[
Text(userData[0]["cropsinfo"][i]["mintemp"].toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
Text('mintemp',style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold),)
],
),
),
),
Padding(padding:EdgeInsets.all(10.0)),
Expanded(
child: Container(
color:Colors.blue,
padding:EdgeInsets.all(20.0),
child: Column(
children: <Widget>[
Text(userData[0]["cropsinfo"][i]["maxppt"].toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
Text('maxppt',style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold),)
],
),
),
),


],
),
SizedBox(height:5.0),
Row(
children: <Widget>[
Expanded(
child: Container(
color:Colors.orange,
padding:EdgeInsets.all(20.0),
child: Column(
children: <Widget>[
Text(userData[0]["cropsinfo"][i]["minppt"].toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize:15.0),),
Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
Text('minppt',style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold),)
],
),
),
),
Padding(padding:EdgeInsets.all(10.0)),
Expanded(
child: Container(
color:Colors.blue,
padding:EdgeInsets.all(20.0),
child: Column(
children: <Widget>[
Text('kathmandu',style: TextStyle(fontWeight:FontWeight.bold,fontSize:13.0),),
Padding( padding: EdgeInsets.fromLTRB(0, 0, 0, 5),),
Text('Place',style: TextStyle(fontSize:13.0,fontWeight:FontWeight.bold),)
],
),
),
),
Padding(padding:EdgeInsets.all(10.0)),
Expanded(

child: Container(

color:Colors.blue,
padding:EdgeInsets.all(20.0),
child: Column(
children: <Widget>[
//InkWell(onTap: (){},)
//IconButton(icon: Icon(Icons.replay), onPressed: (){launch('https://en.wikipedia.org/wiki/Wheat');}),
// RaisedButton(onPressed: (){launch('https://en.wikipedia.org/wiki/Wheat');},
// ),
],
),
),
),


],
),
],
);

}
}