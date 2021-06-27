import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shareyourbook/httpmethods/user_http.dart';
import 'package:shareyourbook/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  UserModel _userInfo =
      UserModel(fbLink: "fblink", gmail: "gmaillink", name: "name");

  UserModel get userInfo => _userInfo;
  set userInfo(UserModel userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }

  Map<String, bool> _userConnections = {
    "fbConnection": true,
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
    print("saveUserData executed");
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

// databases functions
  saveUserToDb() async {
    var result = await UserHttps()
        .saveUser(userInfo.name, userInfo.fbLink, userInfo.gmail);
    print("saveUserToDb result: " + result);
    return result;
  }

  checkIfUserAlreadyExists(gmail) async {
    print("1......");
    String result = await UserHttps().checkUserIfExists(gmail);
    print("await 2......");
    print("The Returned Result");
    print(result.toString());
    return result;
  }

  getAppUserFromDb() async {
    print("using..." + userInfo.gmail);
    UserModel result = await UserHttps().getUserById(userInfo.gmail);
    print("The Returned Result" + result.runtimeType.toString());

    userInfo = result;
    notifyListeners();
  }

  getUserFromDbById(gmail) async {
    print("using..." + userInfo.gmail);
    UserModel result = await UserHttps().getUserById(gmail);
    return result;
  }
}
