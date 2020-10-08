//=================================================
// IMPORT
//=================================================
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../models/MenuModel.dart';
import '../services/MenuServices.dart';
import '../services/UploadImageServices.dart';


class Ep901Page extends StatefulWidget {
  @override
  _Ep901PageState createState() => _Ep901PageState();
}

class _Ep901PageState extends State<Ep901Page> {
//===========================================================
// DECLARE VARIABLE
//===========================================================
TextEditingController menuNoController = TextEditingController()..text = 'M010';
TextEditingController priceController = TextEditingController()..text = '500';
TextEditingController menuNameEngController = TextEditingController()..text = 'Port Curry';
TextEditingController menuNameThaiController= TextEditingController()..text = 'Port Curry';
TextEditingController menuDescEngController= TextEditingController()..text = 'Port Curry';
TextEditingController menuDescThaiController= TextEditingController()..text = 'Port Curry';
TextEditingController menuCategoryValueController= TextEditingController()..text = 'Port Curry';
//===========================================================
// DECLARE IMAGE (EP90)
//===========================================================
File _image;
//===========================================================
// BUILD WIDGET
//===========================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP90-1: UI: Upload Image to FireStorage and upload food to FireStore DB'),),
      body: Column(
        children: <Widget>[
          Expanded(
//===========================================================
// COLUMN#1
//===========================================================              
            child: ListView(children: <Widget>[
//===========================================================
// COLUMN#1.1
//===========================================================        
              Row(
                children: <Widget>[
//===========================================================
// ROW#1
//===========================================================                
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: 
//===========================================================
// IF IMAGE <> NULL
//===========================================================                     
                    _image != null?
//===========================================================
// STACK
//===========================================================                     
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
//===========================================================
// IMAGE AFTER USING IMAGE PICKER
//===========================================================                         
                        // Image(width: 200,height: 150,image: AssetImage('assets/images/pic1.jpg')),
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              // fit: BoxFit.cover,
                              image: AssetImage(_image.path)),
                            // borderRadius: BorderRadius.circular(4)
                          ),
                        ),
//===========================================================
// ROW
//===========================================================                          
                        Row(
                          children: <Widget>[
//===========================================================
// ROW#1: DELETE
//===========================================================                             
                            FlatButton(color: Colors.black38,onPressed: (){setState(() {_image = null;});}, child: Text('Delete',style: TextStyle(color: Colors.white))),
                            SizedBox(width: 20,),
//===========================================================
// ROW#2 UPDATE
//===========================================================                            
                            FlatButton(color: Colors.black38,onPressed: (){ImagePicker().getImage(source: ImageSource.gallery).then((value) {setState(() {_image = File(value.path);});});}, child: Text('Update',style: TextStyle(color: Colors.white))),                            
                          ],
                        ),
                      ],
                    )
//===========================================================
// IF IMAGE = NULL
//===========================================================                       
                    : Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black87),borderRadius: BorderRadius.circular(8),),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
//===========================================================
// COLUMN#1
//===========================================================
                          IconButton(iconSize: 50,icon: Icon(Icons.camera_enhance), onPressed: (){
//===========================================================
// IMAGE PICKER
//===========================================================
                          ImagePicker().getImage(source: ImageSource.gallery).then((value) {setState(() {_image = File(value.path);});});
                          }),
//===========================================================
// COLUMN#2
//===========================================================
                          Text('Upload Image'),
                        ],),
                    )
                    ,
                  ),
//===========================================================
// ROW#1
//===========================================================                
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        TextInputWidget(controller: menuNoController,hintText: 'Menu No',labelText: 'Menu No',textInputType: TextInputType.text,),
                        TextInputWidget(controller: priceController,hintText: 'Price',labelText: 'Price',textInputType: TextInputType.number,),     
                      ],
                    ),
                  ),            
                ],
              ),
//===========================================================
// COLUMN#1.2,3,4,5
//===========================================================    
              TextInputWidget(controller: menuCategoryValueController,hintText: 'Menu Category',labelText: 'Menu Category',textInputType: TextInputType.text,),
              TextInputWidget(controller: menuNameEngController,hintText: 'Menu Name (Eng)',labelText: 'Menu Name (Eng)',textInputType: TextInputType.text,),
              TextInputWidget(controller: menuNameThaiController,hintText: 'Menu Name (Thai)',labelText: 'Menu Name (Thai)',textInputType: TextInputType.text,),
              TextInputWidget(controller: menuDescEngController,hintText: 'Menu Desc (Eng)',labelText: 'Menu Desc (Eng)',textInputType: TextInputType.text,),
              TextInputWidget(controller: menuDescThaiController,hintText: 'Menu Desc (Thai)',labelText: 'Menu Desc (Thai)',textInputType: TextInputType.text,),                            
            ],), 
          ),
//===========================================================
// COLUMN#2 RAISED BUTTOM
//===========================================================    
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){
//===========================================================
// UPLOAD IMAGE
//=========================================================== 
                  UploadImageServices.writeFileToFireBaseStorage(file: _image).then((value) {
//===========================================================
//GET IMAGE URL FROM VALUE
//===========================================================                     
                    print('URL: $value');
//===========================================================
// SAVE TO DATABASE
//===========================================================   
                  MenuServices.saveMenu(
                    menuModel: MenuModel(
                      menuId: menuNoController.text,
                      menuNameEng: menuNameEngController.text,                      
                      menuNameThai: menuNameThaiController.text,
                      menuDescriptionEng: menuDescEngController.text,                      
                      menuDescriptionThai: menuDescThaiController.text,                      
                      menuCategoryValue: menuCategoryValueController.text,
                      price: double.parse( priceController.text),
                      rating: 0,
                      spicyLevel: 1,
                      imageUrl: value,    //ADD EP90
                    )
                  ).then((value) {
                    print('Save MENU COMPLETED');
                  });                    
                  });


                },child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Submit',style: TextStyle(fontSize: 40,color: Colors.white,),),
                ))),             
        ],
        
      ),
      
    );
  }
}//END CLASS

//===========================================================
// WIDGET CLASS
//===========================================================  
class TextInputWidget extends StatelessWidget {
//===========================================================
// DECLARE FINAL VARAIABLE
//=========================================================== 
final TextEditingController controller;
final String hintText;
final String labelText;
final TextInputType textInputType;
//===========================================================
// CONSTRUCTURE
//===========================================================  
  const TextInputWidget({
    this.controller,
    this.hintText,
    this.labelText,
    this.textInputType,
    Key key,
  }) : super(key: key);
//===========================================================
// BUILD WIDGET
//===========================================================  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: labelText,
        labelText: labelText),),
    );
  }
}