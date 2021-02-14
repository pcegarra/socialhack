import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class AppState extends ChangeNotifier {
  ParseUser _currentUser;
  int _currentCategory = -1;

  void setCurrentUser(ParseUser currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }

  ParseUser getCurrentUser() {
    return _currentUser;
  }


  ParseUser get currentUser => _currentUser;

  set currentUser(ParseUser value) {
    _currentUser = value;
  }

  bool isOng() {
    if (_currentUser == null) {
      return false;
    }
    return _currentUser.get<bool>("isOng");
  }

  int get currentCategory => _currentCategory;

  set currentCategory(int value) {
    _currentCategory = value;
    notifyListeners();
  }
}
