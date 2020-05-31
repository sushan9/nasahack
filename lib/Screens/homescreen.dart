import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartagro/Components/Reusable.dart';
import 'package:smartagro/Screens/results.dart';
import '../constants.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  int ph =7;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container( padding: EdgeInsets.fromLTRB(20, 30, 10, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Submit Information', style: TextStyle(
              color: Colors.lightBlueAccent, fontFamily: 'Righteous', fontSize: 22
            ),),
            SizedBox(
              height: 6,
            ),
            ColumnSuper(alignment: Alignment.topRight,
              innerDistance: -110,
              children: <Widget>[
                Text('Fill the correct information for requesting prediction and click on continue', style: TextStyle(
                  fontSize: 15, color: Colors.black54, fontFamily: 'Righteous'
                ),),
                Image(height: 100,width: 90,image: AssetImage('images/agro.png')),
              ],
            ),
            SizedBox(height: 10,),
            Divider(thickness: 1,),
            Row(
              children: <Widget>[
                Text('Enter Your Name', style: TextStyle(fontFamily: 'Righteous', fontSize: 21,color: Colors.black54),),
                SizedBox(width: 10,),
                Icon(Icons.streetview, color: Colors.black54,size: 20,),
              ],
            ),
            SizedBox(height: 5,),
            TextField(textAlign: TextAlign.center,
              decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(width: 0.8,
                        color: Colors.lightBlueAccent),),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(width: 0.8),),
                  hintText: ' Enter Your Name',
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Text('Enter Your ID', style: TextStyle(fontFamily: 'Righteous', fontSize: 21,color: Colors.black54),),
                SizedBox(width: 10,),
                Icon(Icons.account_circle, color: Colors.black54,size: 20,),
              ],
            ),
            SizedBox(height: 5,),
            TextField(keyboardType: TextInputType.number,textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(width: 0.8,
                      color: Colors.lightBlueAccent),),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(width: 0.8),),
                hintText: ' Enter Your ID',
              ),
            ),
            Divider(thickness: 1,),
            Container(
              child: Reusable_Card(
                  colour: Colors.grey[200],
                  CardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 5,),
                      Text(
                        "Select PH",style: TextStyle(fontSize: 20, fontFamily: 'Righteous', color: Colors.black54),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(ph.toString(),style: TextStyle(color: Colors.black, fontFamily: 'Righteous', fontSize: 30),),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                            value: ph.toDouble(),
                            min: 0,
                            max: 10,
                            activeColor: Colors.blue,
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                ph = newValue.round();
                              });
                            }),
                      ),
                      GestureDetector(onTap: (){},child: Text("Don't have ph? Select 0, Request here!", style: TextStyle(fontFamily: 'Righteous'),)),
                      SizedBox(height: 7,),
                    ],
                  )),
            ),
            Divider(thickness: 1,),
            SizedBox(height: 10,),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 22, fontFamily: 'Righteous'),),
                  SizedBox(height: 10.0,),
                  RaisedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1,),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.grey[100],
                  onPressed: () => _selectDate(context),
                  child: Text('Cancel'),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {Navigator.push(context, new MaterialPageRoute(
                      builder: (context) => Results()
                  ));},
                  child: Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
