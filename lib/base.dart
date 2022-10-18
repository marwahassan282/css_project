
import 'package:flutter/material.dart';

class BaseViewModel< T extends BaseNavigator> extends ChangeNotifier{//clean code with design pattern mmvv
late T navigator;
}

 abstract class BaseState <T extends StatefulWidget,  Mv extends BaseViewModel> extends State <T> implements BaseNavigator {

late Mv cm;
 Mv initialviewmodel();
 @override
  void initState() {
 cm=initialviewmodel();

  }



@override
showloading(String message,bool isdismisable) {
  showDialog(
      barrierDismissible: isdismisable,
      context: context, builder: (c){
    return AlertDialog(
      title: Center(
        child: CircularProgressIndicator(),
      ),
    );
  });

}

@override
hideloading() {
  Navigator.pop(context);
}

@override
showmessage(String message,{String? actionname,VoidCallback ?voidCallback}) {
   List<Widget> actions=[];
   if(actionname!=null){
     actions.add(TextButton(onPressed: voidCallback, child: Text(actionname)));
   }
  showDialog(context: context, builder:(c){
    return AlertDialog(
      actions: actions,
      title:  Row(
        children: [
          Expanded(child: Text(message))
        ],
      ),

    );
  });
}
}
 abstract class  BaseNavigator{
  showloading(String message,bool isdissmisable);
  showmessage(String message);
  hideloading();


}