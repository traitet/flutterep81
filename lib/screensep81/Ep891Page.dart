//=================================================
// IMPORT
//=================================================
import 'package:flutter/material.dart';
import 'package:flutterep11/models/MenuModel.dart';
import 'package:flutterep11/services/MenuServices.dart';

class Ep891Page extends StatefulWidget {
  @override
  _Ep891PageState createState() => _Ep891PageState();
}

class _Ep891PageState extends State<Ep891Page> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP89-1: UI: Maintain Menu'),),
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
                    child: Image(width: 200,height: 200,image: AssetImage('assets/images/pic1.jpg')),
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
                    )
                  ).then((value) {
                    print('Save MENU COMPLETED');
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