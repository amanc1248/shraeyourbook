import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shareyourbook/constants/constants.dart';
import 'package:shareyourbook/model/userModel.dart';

class UserHttps {
  checkUserIfExists(gmaillink) async {
    print("2......");
    var url = "http://$localHost:3000/users/check/$gmaillink";
    print("2.1111.....");
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=UTF-8",
    });
    print("2.2222.....");
    print("3......");

    var userDetail = jsonDecode(response.body);
    print("4......");

    print(userDetail);
    if (userDetail.length == 0) {
      print("User does not exist");
      print(userDetail.length.toString());
      return "no user";
    } else {
      print("user existes");
      print(userDetail.length.toString());
      return "user";
    }
  }

  getUserById(gmaillink) async {
    var url = "http://$localHost:3000/users/$gmaillink";
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=UTF-8",
    });
    var userDetail = jsonDecode(response.body);
    print(userDetail);
    UserModel user = UserModel(
      name: userDetail[0]["name"],
      fbLink: userDetail[0]["fblink"],
      gmail: userDetail[0]["gmaillink"],
    );
    return user;
  }

  saveUser(name, fblink, gmaillink) async {
    var url = "http://$localHost:3000/users/save-user";
    final http.Response response = await http.post(Uri.parse(url), body: {
      "name": name,
      "fblink": fblink,
      "gmaillink": gmaillink,
    });
    return response.body;
  }

  editUserDetails(id, name, fblink, instalink, gmaillink) async {
    var url = "http://$localHost:3000/users/edit/$id";
    final http.Response response = await http.patch(Uri.parse(url), body: {
      "name": name,
      "fblink": fblink,
      "gmaillink": gmaillink,
    });
    print(response.body);
  }
}
