import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:stack_nlp/model/AnalyzeEntity.dart';
import 'package:stack_nlp/model/entity_analyze_request.dart';


class NLPNetworkService{
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  final baseURL = "https://language.googleapis.com/v1/documents:analyzeEntities?";

  Future<AnalyzedEntity> findEntity(String searchedText) async{
    print('entered');
    String url = baseURL + "fields=entities%2Clanguage&key=AIzaSyCKRur16NIkvRY7WB0ynGvm46mHDFs13T4";
    //url = Uri.encodeFull(url);


    Document doc = new Document();
    doc.content = searchedText;
    doc.language = "EN";
    doc.type = "PLAIN_TEXT";


    EntityAnalyzeRequest request = new EntityAnalyzeRequest();
    request.document = doc;
    request.encodingType = "UTF8";


    final response = await client.post(url, body: json.encode(request));

    print(response.body.toString());

    if(response.statusCode == 200){
      print("Response is " + response.body);

      return AnalyzedEntity.fromJson(json.decode(response.body));
    }
    else{
      //TODO: best error handling
      throw Exception('Failed to load post');
    }
  }
}