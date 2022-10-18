
import 'package:c_s_s/study/Circuits/showAssiment.dart';
import 'package:c_s_s/study/Circuits/showQuiz.dart';
import 'package:flutter/material.dart';

import 'Lecture.dart';
import 'Section.dart';

class Circuits extends StatelessWidget {
  String title;
  String catagory;
  Circuits(this.title,this.catagory);
static const String routName='klkhihjijsnxn';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: TextStyle(fontSize: 25,
          color: Color(0xF9000000),
          //Color(0xFF5D9CEC),
          fontWeight: FontWeight.w400,)),
      ),
      body:Column(
        children: [
        SizedBox(
        height: 40,
      ),

      Row(
        children: [
          SizedBox(
            width: 44,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Lecture1(catagory)));


            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFF003E90),
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
                  Text('Lecture',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Section1(catagory)));

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
                  Text('Section',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              ),
            ),
          ),

        ],
      ),
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(
                width: 44,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>AssimentScreen(catagory)));


                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF003E90),
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
                      Text('Assiment',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white))
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>QuizScreen(catagory)));

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
                      Text('Quiz',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white))
                    ],
                  ),
                ),
              ),

            ],
          )
        ]));
  }
}
