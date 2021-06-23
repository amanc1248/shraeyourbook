import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/screens/MyBooksScreen.dart';

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
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Profile"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.YourBooks) {
                  Navigator.pushNamed(context, MyBooksScreen.id);
                } else {
                  // _showOnlyFavorites = false;
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
      body: Padding(
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
                  Text(userProvider.userInfo.name)
                ],
              ),
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Contact Details",
              ),
            )),
            Container(
              height: 300,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  buildContactRow(
                      image: "assets/images/facebook.jpg",
                      link: userProvider.userInfo.fbLink),
                  buildContactRow(
                      image: "assets/images/insta.jpg",
                      link: userProvider.userInfo.fbLink),
                  buildContactRow(
                      image: "assets/images/google.jpg",
                      link: userProvider.userInfo.fbLink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildContactRow({required image, required link}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image(
              image: AssetImage(image),
              height: 50,
            ),
          ),
          Text(link),
          TextButton(onPressed: () {}, child: Text("EDIT"))
        ],
      ),
    );
  }
}
