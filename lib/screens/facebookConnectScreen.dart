import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/widgets/bottomNavigation.dart';

class FacebookConnectScreen extends StatefulWidget {
  static const String id = "facebookConnectScreen";
  const FacebookConnectScreen({Key? key}) : super(key: key);

  @override
  _FacebookConnectScreenState createState() => _FacebookConnectScreenState();
}

class _FacebookConnectScreenState extends State<FacebookConnectScreen> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/connect.png"),
                        fit: BoxFit.contain)),
              )),
          Container(
            child: Text(
              "Lets get connected with the interested ",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: Text(
              "readers",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final LoginResult result =
                            await FacebookAuth.instance.login(
                          permissions: ['public_profile', 'email', 'user_link'],
                        );
                        if (result.status == LoginStatus.success) {
                          final userData = await FacebookAuth.i.getUserData(
                            fields: "email,link",
                          );
                          userProvider.userInfo.fbLink = userData['link'];
                          final result = await userProvider.saveUserToDb();
                          print("second saveUserToDb result: " +
                              result.toString());
                          if (result == "OK") {
                            Navigator.pushNamedAndRemoveUntil(
                                context, BottomNavigation.id, (route) => false);
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            width: 2.5,
                            color: Color(0xff4267B2),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Connect To fb"),
                            Image(
                              image: AssetImage("assets/images/facebook.jpg"),
                              height: 50,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
