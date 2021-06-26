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

  Map<String, bool> _userConnections = {
    "fbConnection": false,
    "instaConnection": false,
    "googleConnection": true
  };
  Map<String, bool> get userConnections => _userConnections;
  set userConnections(Map<String, bool> userConnections) {
    _userConnections = userConnections;
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
    var theEmail;
    final preferences = await SharedPreferences.getInstance();
    theEmail = preferences.getString("email").toString();
    print("The saved email " + theEmail);
    print("PREVIOUS isLoggedIn: " + isLoggedIn.toString());
    if (theEmail == 'null') {
      isLoggedIn = false;
    } else {
      isLoggedIn = true;
    }
    print("isLoggedIn changed to " + isLoggedIn.toString());
    return theEmail;
  }

  removeSharedPreferenceData() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('email');
  }
}
