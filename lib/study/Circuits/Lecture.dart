
import 'dart:io';

import 'package:c_s_s/database/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/Lecture.dart';


class Lecture1 extends StatelessWidget {
  static const String routName = "jnkjnjihsdkncsd";
  String catagory;
  Lecture1(this.catagory);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        title: Text(catagory,style: TextStyle(fontSize: 25,
        color: Color(0xF9000000),

    //Color(0xFF5D9CEC),
    fontWeight: FontWeight.w400,)),
    ),
     body:

         StreamBuilder<QuerySnapshot<Lecture>>(
                      stream: DataBaseUtils.getLectureFromFireBase(catagory),
                      builder:(context,snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        else if(snapshot.hasError){
                          return Text('some thing went wrong');
                        }
                        List<Lecture>lectures=snapshot.data?.docs.map((e) => e.data()).toList()??[];
                        return ListView.builder(
                            itemCount: lectures.length,
                            itemBuilder: (context,index){


                              return GestureDetector(
                                onTap: (){
                                  Gotofrist(lectures[index].description);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    child: Center(child: Text(lectures[index].title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.grey
                                    ),

                                  ),
                                ),
                              );

                            }
                        );

                      }
                  )





    );
  }
  Gotofrist(String url)async{
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri))
      await launchUrl(uri);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }
}


