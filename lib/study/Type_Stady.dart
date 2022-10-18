


import 'package:flutter/material.dart';

import 'Circuits/Circuits.dart';


class TypeStudy extends StatelessWidget {
static const String routName ='knkjnjk';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CCSE 2025',style: TextStyle(fontSize: 25,
          color: Color(0xF9000000),
          //Color(0xFF5D9CEC),
          fontWeight: FontWeight.w400,)),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 40,
            ),
            Center(child: Text('Pick your category of Study',style: TextStyle(fontSize: 25,
              color: Color(0xFF003E90),
              //Color(0xFF5D9CEC),
              fontWeight: FontWeight.w400,))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 44,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Circuits('circut','circut')));

                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFFC91C22),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft: Radius.circular(25),topRight: Radius.circular(25)) ,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(60), // Image radius
                            child: Image.asset('assets/images/css.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                       // Image.asset('assets/images/CCSE.jpeg',height: 120,width: 130),
                        Text('Circuits',style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ),
                ),
                SizedBox(//'circut','control2','Data Structure','Logic Circuits','Maths 5','Presention Skill'
                  width: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Circuits('control 2','control2')));

                  },
                  child: Container(

                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF003E90),
                      borderRadius:  BorderRadius.only(bottomRight: Radius.circular(25),topLeft: Radius.circular(25),topRight: Radius.circular(25)) ,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(60), // Image radius
                            child: Image.asset('assets/images/css.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                        Text('Control 2',style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                SizedBox(
                  width: 44,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Circuits('Data structure','Data Structure')));

                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFFED1E79),
                      borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(25),topLeft: Radius.circular(25),topRight: Radius.circular(25)) ,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(60), // Image radius
                            child: Image.asset('assets/images/css.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                        Text('Data Structure',style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Circuits('logic circuts','Logic Circuits')));


                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFFCF7E48),
                      borderRadius:  BorderRadius.only(bottomRight: Radius.circular(25),topLeft: Radius.circular(25),topRight: Radius.circular(25)) ,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(60), // Image radius
                            child: Image.asset('assets/images/css.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                        Text('Logic Circuits',style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                SizedBox(
                  width: 44,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Circuits('maths 5','Maths 5')));

                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF4882CF),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topLeft: Radius.circular(25),topRight: Radius.circular(25)) ,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(60), // Image radius
                            child: Image.asset('assets/images/css.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                        Text('Maths 5',style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Circuits('Presentation Skills','Presention Skill')));

                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2D352),
                      borderRadius:  BorderRadius.only(bottomRight: Radius.circular(25),topLeft: Radius.circular(25),topRight: Radius.circular(25)) ,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(60), // Image radius
                            child: Image.asset('assets/images/css.jpeg', fit: BoxFit.cover),
                          ),
                        ),
                        Text('Presentation Skills',style: Theme.of(context).textTheme.bodyText1,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
