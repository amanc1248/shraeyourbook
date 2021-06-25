import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/widgets/bottomNavigation.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      onTap: () {
                        googleSignIn.signIn().then((userData) {
                          userProvider.userObj = userData!;
                          userProvider.isLoggedIn = true;
                          print(userProvider.userObj);
                          print(userProvider.userObj.email);

                          Navigator.pushReplacementNamed(
                              context, BottomNavigation.id);
                          print("===============>" +
                              userProvider.isLoggedIn.toString());
                        }).catchError((e) {
                          print(e);
                        });

                        // if (userProvider.isLoggedIn == true) {

                        // }
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
