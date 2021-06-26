import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/screens/LoginScreen.dart';
import 'package:shareyourbook/screens/MyBooksScreen.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

enum FilterOptions {
  YourBooks,
  Logout,
}

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool showHud = false;
  goToLoginScreen() {
    print("here I am in else stmt");
    // Future.delayed(Duration(seconds: 1), () {
    //   progress!.dismiss();
    // });
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.id, (route) => false);
  }

  @override
  @override
  Widget build(BuildContext context) {
    GoogleSignIn googleSignIn = GoogleSignIn();
    UserProvider userProvider = Provider.of<UserProvider>(context);
    if (userProvider.isLoggedIn == false) {
      print(
          "Hey man the widget is build again after the isLoggedIn variable is changed👇");
      // goToLoginScreen();
    }
    return ProgressHUD(
        child: Builder(
            builder: (context) => Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text("My Profile"),
                    actions: [
                      PopupMenuButton(
                        onSelected: (FilterOptions selectedValue) {
                          setState(() {
                            if (selectedValue == FilterOptions.YourBooks) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyBooksScreen()));
                            } else {
                              final progress = ProgressHUD.of(context);

                              if (userProvider.isLoggedIn == true) {
                                progress!.showWithText('Logging Out');
                                print("1st executed if stmt");
                                googleSignIn.signOut().then((value) {
                                  userProvider.isLoggedIn = false;
                                  userProvider.removeSharedPreferenceData();
                                  new Future.delayed(new Duration(seconds: 1),
                                      () {
                                    progress.dismiss();
                                    goToLoginScreen();
                                  });
                                }).catchError((e) {
                                  print(e);
                                });
                              }
                            }
                          });
                        },
                        icon: Icon(
                          Icons.more_vert,
                        ),
                        itemBuilder: (_) => [
                          PopupMenuItem(
                            child: GestureDetector(
                              child: Text('Your Books'),
                            ),
                            value: FilterOptions.YourBooks,
                          ),
                          PopupMenuItem(
                            child: Text('Logout'),
                            value: FilterOptions.Logout,
                          ),
                        ],
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 200,
                                  color: Color(0xff6C63FF),
                                ),
                                Text(userProvider.userInfo.name.toString())
                              ],
                            ),
                          ),
                          Container(
                              child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Contact Details",
                              style: TextStyle(fontSize: 15),
                            ),
                          )),
                          Container(
                            height: 300,
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                ConnectToWidget(
                                  image: "assets/images/facebook.jpg",
                                  connectionType: userProvider
                                      .userConnections['fbConnection']!,
                                  text: userProvider.userConnections[
                                              'fbConnection'] ==
                                          true
                                      ? "connected to fb"
                                      : "Connect to fb",
                                  onTapFunction: () async {},
                                ),
                                ConnectToWidget(
                                  image: "assets/images/insta.jpg",
                                  connectionType: userProvider
                                      .userConnections['instaConnection']!,
                                  text: userProvider.userConnections[
                                              'instaConnection'] ==
                                          true
                                      ? "connected to insta"
                                      : "Connect to insta",
                                  onTapFunction: () {},
                                ),
                                ConnectToWidget(
                                  image: "assets/images/google.jpg",
                                  connectionType: userProvider
                                      .userConnections['googleConnection']!,
                                  text: userProvider.userConnections[
                                              'googleConnection'] ==
                                          true
                                      ? "connected to google"
                                      : "Connect to google",
                                  onTapFunction: () {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

// ignore: must_be_immutable
class ConnectToWidget extends StatefulWidget {
  final String image;
  String text;
  void Function()? onTapFunction;
  bool connectionType;
  ConnectToWidget(
      {required this.image,
      required this.text,
      required this.onTapFunction,
      required this.connectionType});

  @override
  _ConnectToWidgetState createState() => _ConnectToWidgetState();
}

class _ConnectToWidgetState extends State<ConnectToWidget> {
  bool isEditingText = false;
  TextEditingController? _editingController;
  // String? initialText;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    _editingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image(
                image: AssetImage(widget.image),
                height: 50,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: widget.onTapFunction,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: widget.connectionType
                        ? Color(0xff5EE173)
                        : Color(0xffE15E5E),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
