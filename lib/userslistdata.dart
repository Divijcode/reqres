import 'package:http/http.dart' as http;


class UsersData{

  String data;

  Future<dynamic> getUsersList () async {
    try {
      final http.Response response = await http.get(
          'https://reqres.in/api/users?page=2');
      data = response.body;

      return data;
    }catch(e){
      print(e);
    }
  }
}