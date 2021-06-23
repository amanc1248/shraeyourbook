import 'package:flutter/cupertino.dart';
import 'package:shareyourbook/model/userModel.dart';

class UserProvider with ChangeNotifier {
  UserModel _userInfo = UserModel(
      id: "1",
      name: "Sudeep Bhattrai",
      fbLink: "www.facebook.com/",
      instaLink: "www.instagram.com",
      gmail: "www.gmail.com");

  UserModel get userInfo => _userInfo;
  set userInfo(UserModel userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }
}
