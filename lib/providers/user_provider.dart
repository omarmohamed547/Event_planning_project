import 'package:event_planning_ass/model/User_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? currentuser;
  updateUser(UserModel newUser) {
    currentuser = newUser;
    notifyListeners();
  }
}
