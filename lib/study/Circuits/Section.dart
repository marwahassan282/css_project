import 'package:c_s_s/models/Section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../database/utils.dart';

class Section1 extends StatelessWidget {
  static const String routName = "sdfoisj";
  String catagory;
  Section1(this.catagory);

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
     StreamBuilder<QuerySnapshot<Section>>(
                      stream: DataBaseUtils.getSectioneFromFireBase(catagory),
                      builder:(context,snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        else if(snapshot.hasError){
                          return Text('some thing went wrong');
                        }
                        List<Section>sections=snapshot.data?.docs.map((e) => e.data()).toList()??[];
                        return ListView.builder(
                            itemCount: sections.length,
                            itemBuilder: (context,index){


                              return GestureDetector(
                                onTap: (){
                                  Gotofrist(sections[index].description);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          color: Colors.grey
                                      ),
                                      child: Center(child: Text(sections[index].title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),

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
