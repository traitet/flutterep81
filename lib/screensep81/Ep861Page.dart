
//===================================================
// IMPORT
//===================================================
import 'package:flutter/material.dart';
import 'dart:io';
import '../services/FileStorageServices.dart';
import 'package:image_picker/image_picker.dart';
//===================================================
// CLASS
//===================================================
class Ep861Page extends StatefulWidget {
  @override
  _Ep861PageState createState() => _Ep861PageState();
}
//===================================================
// STATE CLASS
//===================================================
class _Ep861PageState extends State<Ep861Page> {
//===================================================
// DECLARE VARIABLE
//===================================================
File _image;   

//===================================================
// BUILD WIDGET
//===================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP86-1 - Test Connection Firebase Cloud and Flutter for Database services (Write File Storage) ',style: TextStyle(fontSize: 14),maxLines: 2,),),
      body: ListView(children: <Widget>[
//===================================================
// BUTTONS#1) LOAD FILE BY IMAGE PICKER
//===================================================     
            RaisedButton(onPressed: (){
              ImagePicker().getImage(source: ImageSource.gallery).then((value) {
//===================================================
// SET STATE = GET _IMAGE & RELOAD UI
//===================================================                 
                setState(() {_image = File(value.path);});
              });
            },child: Text('Load File by Image Picker'),),  
//===================================================
// SHOW IMAGE LOADED
//===================================================             
           _image!=null ? Image.asset(_image.path,height: 300,): Center(child: Text('Please click Load file to upload image')),
//===================================================
// BUTTONS#3) UPLOAD FILE TO GOOGLE STORAGE CLOUD
//===================================================            
            RaisedButton(onPressed: (){FileStorageServices.writeFileToFireBaseStorage(file: _image);},child: Text('Write File to Firebase Storage'),),     
                                                                                                                        
      ],),
      
    );
  }
}