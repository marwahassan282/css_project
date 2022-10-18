import 'package:c_s_s/addtofirebase/addAssiment.dart';
import 'package:c_s_s/addtofirebase/addQiuz.dart';
import 'package:c_s_s/addtofirebase/addlecture.dart';
import 'package:c_s_s/addtofirebase/addsection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../study/Type_Stady.dart';

class AdmineHome extends StatelessWidget {
  const AdmineHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: SingleChildScrollView(


       child: Padding(
         padding: const EdgeInsets.all(30.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>AddLecture()));

              },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue
                      ),
                      child: Center(child: Text('add Lecture ',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),))),
                )),
             SizedBox(
               height: 20,
             ),
             GestureDetector(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder:(context)=>AddSection()));

               },

                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue
                        ),
                        child: Center(child: Text('add section ',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),))),
                  ))),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>AddQuiz()));

                  },

                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue
                        ),
                        child: Center(child: Text('add Quiz ',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),))),
                  ))),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>AddAssiment()));

                  },

                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue
                        ),
                        child: Center(child: Text('add Assiment ',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color: Colors.white),))),
                  ))),

            ],
          ),
       ),
     ),
    );
  }
}
