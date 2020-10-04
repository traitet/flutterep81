import 'package:flutter/material.dart';


class Ep811Page extends StatefulWidget {
  @override
  _Ep811PageState createState() => _Ep811PageState();
}

class _Ep811PageState extends State<Ep811Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP61-1: Download and upload Github'),),
      body: ListView(children: <Widget>[
        Image(image: AssetImage('assets/images/ep611.jpg'),),
        Image(image: AssetImage('assets/images/ep612.jpg'),),      
        Image(image: AssetImage('assets/images/ep613.jpg'),),
        Image(image: AssetImage('assets/images/ep614.jpg'),),     
        Image(image: AssetImage('assets/images/ep615.jpg'),),
        Image(image: AssetImage('assets/images/ep616.jpg'),),      
        Image(image: AssetImage('assets/images/ep617.jpg'),),
        Image(image: AssetImage('assets/images/ep618.jpg'),),   
        Image(image: AssetImage('assets/images/ep619.jpg'),),
        Image(image: AssetImage('assets/images/ep620.jpg'),),      
        Image(image: AssetImage('assets/images/ep621.jpg'),),                    
      ],),
      
    );
  }
}