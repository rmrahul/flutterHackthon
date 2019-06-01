import 'package:stack_nlp/model/user_list.dart';

import '../repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc{
  final _repository = UserRepository();
  final _userFetchers = PublishSubject<UserList>();


  Observable<UserList> get findUsers => _userFetchers.stream;

  fetchUserList(String name) async{
    UserList userList = await _repository.fetchUserList(name);
    _userFetchers.sink.add(userList);
  }

  dispose(){
    _userFetchers.close();
  }
}

final userBloc = UserBloc();
