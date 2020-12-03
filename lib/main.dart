import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'RegistrationScreen.dart';
import 'UsersList.dart';
import 'userslistdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(



      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id:(context) => HomeScreen(),
        LoginScreen.id:(context) => LoginScreen(),
        RegistrationScreen.id:(context) => RegistrationScreen(),
        UsersList.id:(context) => UsersList(),

      },
    );
  }
}

// TextField(
// onChanged: (val){
// inputEmail=val;
// },
// ),
// TextField(
// onChanged: (val){
// inputPassword=val;
// },
// ),
// FlatButton(onPressed: (){
// register(inputEmail, inputPassword);
// },
// child: Text('register')),
