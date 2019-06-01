import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:stack_nlp/model/question_list.dart';
import 'dart:convert';


class QuestionsNetworkService{
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  final baseURL = "https://api.stackexchange.com/";

  Future<QuestionList> fetchQeustionList(String searchedText,bool isAccepted) async{
    print('entered');
    String url = baseURL + "/2.2/search/advanced?key=U4DMV*8nvpm3EOpvf69Rxw((&site=stackoverflow&order=desc&sort=activity&q=$searchedText&accepted=$isAccepted&filter=default";
    url = Uri.encodeFull(url);

    final response = await client.get(url);

    print(response.body.toString());

    if(response.statusCode == 200){
      return QuestionList.fromJson(json.decode(response.body));
    }
    else{
      //TODO: best error handling
      throw Exception('Failed to load post');
    }
  }
}