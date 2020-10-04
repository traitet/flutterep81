
//===================================================
// IMPORT
//===================================================
import 'package:flutter/material.dart';
import '../services/DatabaseServices.dart';

class Ep851Page extends StatefulWidget {
  @override
  _Ep851PageState createState() => _Ep851PageState();
}

class _Ep851PageState extends State<Ep851Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP85-1 - Test Connection Firebase Cloud and Flutter for Database services (Write DB, Read DB) ',style: TextStyle(fontSize: 14),maxLines: 2,),),
      body: ListView(children: <Widget>[
//===================================================
// BUTTONS
//===================================================        
            RaisedButton(onPressed: (){DatabaseServices.writeDataToDB();},child: Text('Write Data to Database'),),     
            RaisedButton(onPressed: (){DatabaseServices.readDataFromDB();},child: Text('Read Data from Database'),),                                                                                                                           
      ],),
      
    );
  }
}