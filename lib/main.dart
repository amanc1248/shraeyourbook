import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/booksProvider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/provider/yourBooksProvider.dart';
import 'package:shareyourbook/screens/AddBookScreen.dart';
import 'package:shareyourbook/screens/EditBookScreen.dart';
import 'package:shareyourbook/screens/HomeScreen.dart';
import 'package:shareyourbook/screens/LoginScreen.dart';
import 'package:shareyourbook/screens/MyBooksScreen.dart';
import 'package:shareyourbook/widgets/bottomNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BooksProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
        ChangeNotifierProvider.value(
          value: YourBooksProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.blue, fontFamily: "BalooTammudu2"),
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          AddBookScreen.id: (context) => AddBookScreen(),
          MyBooksScreen.id: (context) => MyBooksScreen(),
          EditBookScreen.id: (context) => EditBookScreen(),
          BottomNavigation.id: (context) => BottomNavigation(),
        },
      ),
    );
  }
}
