import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shareyourbook/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  late GoogleSignInAccount _userObj;
  GoogleSignInAccount get userObj => _userObj;
  set userObj(GoogleSignInAccount userObj) {
    _userObj = userObj;
    notifyListeners();
  }

  saveUserData(email) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("email", email);
    notifyListeners();
  }

  getUserData() async {
    String theEmail;
    final preferences = await SharedPreferences.getInstance();
    theEmail = preferences.getString("email").toString();
    print("The saved email " + theEmail.toString());
    if (theEmail == null) {
      isLoggedIn = false;
    } else {
      isLoggedIn = true;
    }
    notifyListeners();
  }
}
