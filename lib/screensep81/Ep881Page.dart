//=================================================
// IMPORT
//=================================================
import 'package:flutter/material.dart';

//=================================================
// MAIN CLASS
//=================================================
class Ep881Page extends StatefulWidget {
  @override
  _Ep881PageState createState() => _Ep881PageState();
}

//=================================================
// STATE CLASS
//=================================================
class _Ep881PageState extends State<Ep881Page> {
//=================================================
// DECLARE VARIABLE
//=================================================
int _tabIndex = 0;    
//=================================================
// BUILD WIDGET
//=================================================  
  @override
  Widget build(BuildContext context) {
//=================================================
// SCAFFOLD
//=================================================    
    return Scaffold(
//=================================================
// APP BAR
//=================================================      
      appBar: AppBar(title: Text('EP88-1: BottomNavigation Bar for Make Order Screen'),),
//=================================================
// BOTTOM NAVIGATION BAR
//=================================================         
      bottomNavigationBar: BottomNavigationBar(
//=================================================
// BOTTOM NAVIGATION: TYPE 
//=================================================             
        type:  BottomNavigationBarType.fixed,
//=================================================
// BOTTOM NAVIGATION: CURREN INDEX 
//=================================================          
        currentIndex: _tabIndex,
//=================================================
// EVENT ONTAB
//=================================================          
        onTap: (int index){
            setState(() {
              _tabIndex = index;
            });
        },
//=================================================
// BOTTOM NAVIGATION: TYPE 
//=================================================          
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Order (4)')),
          BottomNavigationBarItem(icon: Icon(Icons.list),title: Text('Check Status')),   
          BottomNavigationBarItem(icon: Icon(Icons.payment),title: Text('Payment')),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz),title: Text('More')),                                         
        ],
      ),
//=================================================
// BODY
//=================================================      
      body: _tabIndex == 0 ? Tab1():    // IF TAB = 0 T SHOW TAB#1
            _tabIndex == 1 ? Tab2():    // ELSE IF TAB = 1 SHOW TAB#2
            _tabIndex == 2 ? Tab3():    // ELSE IF TAB = 2 SHOW TAB#3
            Tab4()                      // ELSE SHOW TAB#4
    );
  }
}

//=================================================
// TAB#1
//=================================================   
class Tab1 extends StatelessWidget {
  const Tab1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('TAB#1')),
    );
  }
}

//=================================================
// TAB#2
//=================================================   
class Tab2 extends StatelessWidget {
  const Tab2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('TAB#2')),
    );
  }
}

//=================================================
// TAB#3
//=================================================   
class Tab3 extends StatelessWidget {
  const Tab3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('TAB#3')),
    );
  }
}

//=================================================
// TAB#4
//=================================================  
class Tab4 extends StatelessWidget {
  const Tab4({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text('TAB#4'),));
  }
}
