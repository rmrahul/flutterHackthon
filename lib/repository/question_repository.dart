import 'package:stack_nlp/model/question_list.dart';

import '../services/question_network_service.dart';


class QuestionsRepository{
  final _questionsAPIService = QuestionsNetworkService();

  Future<QuestionList> fetchQuestionList(String searchedText, bool isAccepted){
    return _questionsAPIService.fetchQeustionList(searchedText, isAccepted);
  }

}