import 'package:flutter/material.dart';

import '../Modal_Class/user.dart';

class UserDetailsProvider extends ChangeNotifier {
  List<UserDetails> _userDetailsList = [];

  List<UserDetails> get usersDetailsList => _userDetailsList;

  void addSignupDetails(UserDetails details) {
    _userDetailsList.add(details);
    notifyListeners();
  }

  void removeSignupDetails(String username) {
    _userDetailsList.removeWhere((details) => details.username == username);
    notifyListeners();
  }

}
