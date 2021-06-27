import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/screens/facebookConnectScreen.dart';
import 'package:shareyourbook/widgets/bottomNavigation.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GoogleSignIn googleSignIn = GoogleSignIn();

    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/reading.png"),
                        fit: BoxFit.cover)),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        googleSignIn.signIn().then((userData) async {
                          print("google Sign in executed");
                          userProvider.userObj = userData!;
                          print("here too");
                          userProvider.userInfo.name = userData.displayName!;
                          print(userProvider.userInfo.name);
                          print("here too");

                          userProvider.userInfo.gmail = userData.email;
                          print(userProvider.userInfo.gmail);
                          await userProvider.saveUserData(userData.email);

                          var result =
                              await userProvider.checkIfUserAlreadyExists(
                                  userProvider.userInfo.gmail);

                          // final result = userProvider.getAppUserFromDb();
                          print(
                              "Frontend returned result:" + result.toString());
                          print(result.runtimeType);
                          if (result == 'no user') {
                            Navigator.pushNamedAndRemoveUntil(context,
                                FacebookConnectScreen.id, (route) => false);
                          } else {
                            Navigator.pushNamedAndRemoveUntil(
                                context, BottomNavigation.id, (route) => false);
                          }
                        }).catchError((e) {
                          print(e);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            width: 2.5,
                            color: Color(0xffEB4132),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Login with Google"),
                            Image(
                              image: AssetImage("assets/images/google.jpg"),
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
