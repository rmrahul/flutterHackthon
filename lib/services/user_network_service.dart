import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:stack_nlp/model/user_list.dart';
import 'dart:convert';

class UserNetworkService{
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  final baseURL = "https://api.stackexchange.com/";

  Future<UserList> fetchUserList(String name) async{
    print('entered');
    String url = baseURL + "/2.2/users?key=U4DMV*8nvpm3EOpvf69Rxw((&site=stackoverflow&order=desc&sort=reputation&inname=$name&filter=default";
    url = Uri.encodeFull(url);

    final response = await client.get(url);

    print(response.body.toString());

    if(response.statusCode == 200){
      return UserList.fromJson(json.decode(response.body));
    }
    else{
      //TODO: best error handling
      throw Exception('Failed to load post');
    }
  }
}