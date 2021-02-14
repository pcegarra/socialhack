import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AppState extends ChangeNotifier {
  ParseUser _currentUser;

  void setCurrentUser(ParseUser currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }

  ParseUser getCurrentUser(){
    return _currentUser;
  }

  bool isOng(){
    if(_currentUser==null){
      return false;
    }
    return _currentUser.get<bool>("isOng");
  }
}
