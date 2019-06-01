import 'package:stack_nlp/model/AnalyzeEntity.dart';

import '../services/nlp_network_service.dart';


class NLPRepository{
  final _nlpAPIService = NLPNetworkService();

  Future<AnalyzedEntity> findEntity(String searchedText){
    return _nlpAPIService.findEntity(searchedText);
  }

}
