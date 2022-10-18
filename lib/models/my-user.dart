class MyUser{
String id;
String fName;
String lName;
String userName;
String email;
static const collctionName='user';
MyUser({ required this.id,required this.fName,required this.lName,required this.userName,required this.email});

MyUser.fromjoson(Map<String,dynamic> joson):this(
  id: joson['id'] ,
  fName: joson['fName'] ,
  lName: joson['lName'] ,
  userName: joson['userName'] ,
  email: joson['email'] ,

);

 Map<String,dynamic>tojoson(){

   return{
   'id':id,
   'fName':fName,
   'lName':lName,
   'userName':userName,
   'email' :email


   };
 }





}