import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'package:reqres/Buttons.dart';
import 'package:toast/toast.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id='reg_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  
  
  String inputEmail,inputPassword;

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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

              TextField(
                onChanged: (val){
                  inputEmail=val;
                },
                decoration: kTextfieldstyle.copyWith(hintText: 'Enter your email'),

              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                onChanged: (val){
                  inputPassword =val;
                },
                decoration: kTextfieldstyle.copyWith(hintText: 'Enter your password'),

              ),

              HomeScreenbuttons(text: 'Register',colour: Colors.blue,
                onPressed: () async {
                  http.Response response;
                  response = await http.post('https://reqres.in/api/register',
                      body: {'email': inputEmail, 'password': inputPassword});
                  print(response.body + "${response.statusCode}");
                  if (response.statusCode == 200) {
                    Toast.show("Registration Successful", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  } else {
                    Toast.show("check email and password", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  }
                }
    ),
            ],
          ),
        ),
      ),
    );
  }
}


