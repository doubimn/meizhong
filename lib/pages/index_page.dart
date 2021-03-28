import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../config/index.dart';
import 'home_page.dart';
import 'add_page.dart';
import 'message_page.dart';
import 'mine_page.dart';
import 'find_page.dart';
import '../provide/current_index_provide.dart';

class IndexPage extends StatelessWidget{
  final List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(

        activeIcon:Image(height:25,width: 25,image: AssetImage('assets/images/home_checked.png')),
        icon: Image(height:25,width: 25,image: AssetImage('assets/images/shoping_normal.png')),
        label:KString.homeTitle ),
    BottomNavigationBarItem(
        activeIcon:Image(height:25,width: 25,image:AssetImage("assets/images/find_checked.png")),
        icon: Image(height:25,width: 25,image: AssetImage('assets/images/find_normal.png')),
        label:KString.findTitle ),
    BottomNavigationBarItem(
        icon:Image(height:25,width: 25,image:AssetImage("assets/images/add_checked.png")),
       // activeIcon: Image(height:20,width: 20,image: AssetImage('images/add_checked.png')),
        backgroundColor: Color.fromRGBO(255, 85, 35, 1.0),
        label: "",
    ),
    BottomNavigationBarItem(
        activeIcon:Image(height:25,width: 25,image:AssetImage("assets/images/message_checked.png")),
        icon: Image(height:25,width: 25,image: AssetImage('assets/images/message_normal.png')),
        label:KString.messageTitle ),
    BottomNavigationBarItem(
        activeIcon:Image(height:25,width: 25,image:AssetImage("assets/images/persion_checked.png")),
        icon: Image(height:25,width: 25,image: AssetImage('assets/images/persion_normal.png')),
        label:KString.mineTitle )
  ];

  final List<Widget> tabBodies =[
    HomePage(),
    FindPage(),
    AddPage(),
    MessagePage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Provide<CurrentIndexProvide>(
        builder: (context,child,val){
          // 取到
          int currentIndex =Provide.value<CurrentIndexProvide>(context).currentIndex;
          return Scaffold(
            backgroundColor: Color.fromRGBO(244, 255, 255, 1.0),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              width:48,
              height: 48,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.fromLTRB(0,52, 0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white,
              ),
              child: FloatingActionButton(
                child: Icon(Icons.add,size:25.0),
                onPressed: (){
                  print("你点击了ADD");
                  //调整进入Addpage()
                  Provide.value<CurrentIndexProvide>(context).changeIndex(2);
                },
                elevation: 4,
                backgroundColor: Color.fromRGBO(255, 85, 35, 1.0),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              selectedItemColor:  Color.fromRGBO(255, 85, 35, 1.0),
              items: bottomItems,
              onTap: (index){
                Provide.value<CurrentIndexProvide>(context).changeIndex(index);
              },
            ),
            body: IndexedStack(
              index: currentIndex,
              children: tabBodies,
            ),
          );
        }
    );
  }

}