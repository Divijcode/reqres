import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersList extends StatefulWidget {
  static const String id='users_screen';

  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  var data=null;
  String fname,lname,email,name;


  Future<void> getUsersList () async {
    try {

      http.Response response = await http.get(
          'https://reqres.in/api/users?page=2');
      setState(() {
        data = response.body;
        data = jsonDecode(data);
      });

    }catch(e){
      print(e);
    }
  }

  String getname(int index){
    return data['data'][index]['first_name'] + data['data'][index]['last_name'] ;
  }
  String getemail(int index){
    return data['data'][index]['email'] ;
  }
  String getimage(int index){
    return data['data'][index]['avatar'];
  }


  @override
  void initState() {
    getUsersList();
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
      getUsersList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users List'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
              child: ListView.builder(
                itemCount: 6,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(backgroundColor:Colors.transparent,child: Image.network(getimage(index))),
                        title: Text(
                        getname(index),
                        ),
                        subtitle: Text(
                          getemail(index),
                        ),
                      ),
                    );
                  },

              ),
        ),
      ),
    );
  }
}
