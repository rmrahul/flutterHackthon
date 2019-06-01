import 'package:stack_nlp/model/AnalyzeEntity.dart';

import '../repository/nlp_repository.dart';
import 'package:rxdart/rxdart.dart';

class NLPBloc{
  final _repository = NLPRepository();
  final _entityFetchers = PublishSubject<AnalyzedEntity>();


  Observable<AnalyzedEntity> get findEntity => _entityFetchers.stream;

  findEntityOfText(String searchedText) async{
    AnalyzedEntity userList = await _repository.findEntity(searchedText);
    _entityFetchers.sink.add(userList);
  }

  dispose(){
    _entityFetchers.close();
  }
}

final nlpBloc = NLPBloc();
