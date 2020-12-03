import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'RegistrationScreen.dart';
import 'package:http/http.dart' as http;
import 'package:reqres/Buttons.dart';
import 'UsersList.dart';

class HomeScreen extends StatefulWidget {
  static const String id='home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String inputPassword,inputEmail;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Reqres',
                    style: TextStyle(
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                    ),),
                ),
              ),

              SizedBox(
                height: 30.0,
              ),
              HomeScreenbuttons(text: 'Log In',colour: Colors.lightBlueAccent, onPressed:  () {
                Navigator.pushNamed(context, LoginScreen.id);
                //Go to login screen.
              },),
              HomeScreenbuttons(text: 'Register',colour:Colors.blue,onPressed:  () {
                Navigator.pushNamed(context, RegistrationScreen.id);

              },),
              HomeScreenbuttons(text: 'List Users',colour: Colors.blue.shade700, onPressed:  () {
                Navigator.pushNamed(context, UsersList.id);
                //Go to login screen.
              },),
            ],
          ),
        ),
      ),
    );
  }
}

