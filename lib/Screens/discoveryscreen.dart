import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoveryScreen extends StatefulWidget {
  @override
  _DiscoveryScreenState createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ColumnSuper(
              innerDistance: -50.0,
              children: <Widget>[
                Container( padding: EdgeInsets.fromLTRB( 20,30,20,0),
                  color: Colors.green[400],
                  height: 170,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Welcome to SmartAgro', style: TextStyle(fontSize: 22, fontFamily: 'Righteous', color: Colors.grey[300],),),
                      Text("It's a sunny day!", style: TextStyle(fontSize: 33, fontFamily: 'Righteous', color: Colors.grey[300],),),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey[100],
                    boxShadow:[ BoxShadow(
                      offset: Offset(0, 10),
                      color: Colors.grey[400],
                      blurRadius: 20,
                    ),],
                  ),
                  height: 200,
                  width: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.green[400],
                                child: Icon(Icons.flare, color: Colors.white,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' 28°C', style: TextStyle(fontFamily: 'Righteous', fontSize: 17)),
                                  Text(' Temperature',style: TextStyle(fontFamily: 'Righteous', fontSize: 15, color: Colors.black54))
                                ],
                              ),
                            ],
                          ),
                        Row(
                          children: <Widget>[

                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blue[400],
                              child: Icon(Icons.opacity, color: Colors.white,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(' 61%', style: TextStyle(fontFamily: 'Righteous', fontSize: 17)),
                                Text(' Humidity',style: TextStyle(fontFamily: 'Righteous', fontSize: 15, color: Colors.black54))
                              ],
                            ),

                          ],
                        )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.purple[400],
                                child: Icon(Icons.beach_access, color: Colors.white,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' 0.0 mm', style: TextStyle(fontFamily: 'Righteous', fontSize: 17)),
                                  Text(' Rain-fall      ',style: TextStyle(fontFamily: 'Righteous', fontSize: 15, color: Colors.black54))
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.yellow[800],
                                child: Icon(Icons.landscape, color: Colors.white,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(' 3.9 m/s', style: TextStyle(fontFamily: 'Righteous', fontSize: 17)),
                                  Text(' Wind',style: TextStyle(fontFamily: 'Righteous', fontSize: 15, color: Colors.black54))
                                ],
                              ),

                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
          child: Text('Trending in Kathmandu', style: TextStyle(
            fontFamily: 'Righteous',
            fontSize: 25,
            color: Colors.black54
          ),),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TrendingCart(url: 'images/maize.jpg',name: 'Maize ( मकै )',price: 'NRs. 250.0 /kg',),
                TrendingCart(url: 'images/potato.jpg',name: 'Potato ( आलु )',price: 'NRs. 200.0 /kg',),
                TrendingCart(url: 'images/millet.jpg',name: 'Millet ( कोदो )',price: 'NRs. 100.0 /kg',),
                TrendingCart(url: 'images/tomaato.jpg',name: 'Tomato ( टमाटर  )',price: 'NRs. 250.0 /kg',),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TrendingCart extends StatelessWidget {
  TrendingCart({this.url,this.name,this.price});
 String url,name,price;
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200],
        boxShadow:[ BoxShadow(
          offset: Offset(0, 2),
          color: Colors.white,
          blurRadius: 20,
        ),],
      ),
      height: 120,
      width: 350,
      child: Row(
        children: <Widget>[
          Image(image: AssetImage(url),),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(name, style: TextStyle(
                fontSize: 25, fontFamily: 'Righteous'
              ),),
              Text('Market Price:', style: TextStyle(
                  fontSize: 20, fontFamily: 'Righteous'
              ),),
              Text(price, style: TextStyle(
                  fontSize: 20, fontFamily: 'Righteous'
              ),),
            ],
          )
        ],
      ),
    );
  }
}
