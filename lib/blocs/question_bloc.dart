import 'package:stack_nlp/model/question_list.dart';

import '../repository/question_repository.dart';
import 'package:rxdart/rxdart.dart';

class QuestionsBloc{
  final _repository = QuestionsRepository();
  final _questionFetchers = PublishSubject<QuestionList>();


  Observable<QuestionList> get findQuestions => _questionFetchers.stream;

  fetchQuestions(String searchedText, bool isAccepted) async{
    QuestionList userList = await _repository.fetchQuestionList(searchedText, isAccepted);
    _questionFetchers.sink.add(userList);
  }

  dispose(){
    _questionFetchers.close();
  }
}

final questionBloc = QuestionsBloc();
