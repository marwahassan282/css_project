import 'package:c_s_s/chat.dart';
import 'package:c_s_s/search.dart';
import 'package:c_s_s/study/Type_Stady.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
  List<Widget> screens=[TypeStudy(), SearchScreen(),ChatScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

        bottomNavigationBar:  BottomNavigationBar(

        onTap: (index) {

          currentIndex = index;

          setState(() {});

        },

        currentIndex: currentIndex,



        items: [



          BottomNavigationBarItem(

            label: 'Home',

            icon: Icon(Icons.home_filled),

            ),



          BottomNavigationBarItem(label:'search',

            icon: Icon(Icons.search),

          ),

          BottomNavigationBarItem(

            label:'chat',

            icon: Icon(Icons.chat),

          ),







        ],



      ),

    );
  }

}
