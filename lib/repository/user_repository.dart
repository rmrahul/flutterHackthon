import 'package:stack_nlp/model/user_list.dart';

import '../services/user_network_service.dart';

class UserRepository{
  final _userAPIService = UserNetworkService();

  Future<UserList> fetchUserList(String name){
    return _userAPIService.fetchUserList(name);
  }

}