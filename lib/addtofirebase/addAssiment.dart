import 'package:c_s_s/database/utils.dart';
import 'package:c_s_s/models/Assiment.dart';
import 'package:c_s_s/models/Lecture.dart';
import 'package:c_s_s/services/alarm.dart';
import 'package:c_s_s/study/Circuits/showAssiment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import '../services/local_notification_service.dart';

class AddAssiment extends StatefulWidget {
  const AddAssiment({Key? key}) : super(key: key);

  @override
  State<AddAssiment> createState() => _AddAssimentState();
}

class _AddAssimentState extends State<AddAssiment> {
  bool istime=false;
  var selectedDate=DateTime.now();

  var selectedTime=TimeOfDay.now();
  var constTime=TimeOfDay.now();
  String ? selectedCatagory;
 GlobalKey<FormState> globalKey = GlobalKey<FormState>();
 List<String>carsType=['circut','control2','Data Structure','Logic Circuits','Maths 5','Presention Skill'];




  var titleController = TextEditingController();
  var titlenotificationController = TextEditingController();
  var descriptionController = TextEditingController();
  var descController=TextEditingController();

  @override
  void initState() {
    if(selectedTime==constTime){
      istime=true;
    }
   // LocalNotificationService.init(false);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView (
          child: Form(
            key: globalKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: titleController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter Name of Assiment',


                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),

                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(8)
                        ),
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'please enter Title';
                          }
                          return null;
                        },


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: descriptionController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter Link of Assiment',


                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),

                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(8)
                        ),
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'please enter Enter Link of Assiment';
                          }
                          return null;
                        },


                      ),
                    ),
                    InkWell(
                        onTap: (){
                          openDatePicker();
                        },
                        child: Text('${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign:TextAlign.center)),
                    InkWell(
                        onTap: (){
                          openTimePicker();
                        },
                        child: Text('${selectedTime.format(context)}' ,style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign:TextAlign.center)),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: titlenotificationController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter title of notification',


                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),

                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(8)
                        ),
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'please title of notification';
                          }
                          return null;
                        },


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: descController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter description of notification',


                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),

                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(8)
                        ),
                        validator: (text) {
                          if (text == null || text
                              .trim()
                              .isEmpty) {
                            return 'please description of notification';
                          }
                          return null;
                        },


                      ),
                    ),

                    DropdownButton(
                      iconSize: 26,
                      dropdownColor: Colors.black,
                      hint: const Text('choose your type of study',style: TextStyle(color: Colors.grey,fontSize: 20),),
                      onChanged: (newValue){
                        setState(() {
                          selectedCatagory=newValue.toString();
                        });
                      },
                      value: selectedCatagory,
                      items: carsType.map((car){
                        return DropdownMenuItem(
                            value: car,
                            child: Text(car.toString(),style: const TextStyle(color: Colors.grey,fontSize: 15),));

                      }).toList(),
                    ),
                    


                    ElevatedButton(onPressed: () {
                      addleturetoFirebase();
                    }, child: Text('add to firebase ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                    ElevatedButton(
                      onPressed: () async {
                        LocalNotificationService.showNotification(id: 0,title: titlenotificationController.text,
                        body: descController.text,payload: 'kkkkkk');

                        Workmanager().registerOneOffTask(
                          "taskOne",
                          "backUp",
                          initialDelay: Duration(seconds: selectedTime.minute),
                        );
                       // AlarmManager.oneShotAtTaskCallback(titlenotificationController.text, descController.text);
                                             },
                      child: const Text('add notification'),
                    ),


                  ],
                ),
              ),
            ),),
        ),
      ),
    );
  }


  void addleturetoFirebase() {
    if (globalKey.currentState!.validate()){
    Assiment assiment=Assiment(catagory: selectedCatagory!, title: titleController.text, description: descriptionController.text, datetime: selectedDate.microsecondsSinceEpoch);
      DataBaseUtils.CreateAssiment(assiment);

    }

  }
  openDatePicker()async{
    var chosenDate= await showDatePicker(context: context, initialDate:selectedDate, firstDate: DateTime.now(), lastDate:DateTime.now().add(Duration(days: 365)));
    if(chosenDate!=null){
      selectedDate=chosenDate;

    }
    setState(() {

    });
  }
  openTimePicker()async{
    var chosenTime= await showTimePicker(context: context, initialTime: selectedTime,);



    setState(() {
  selectedTime=chosenTime!;
    });
  }
}
