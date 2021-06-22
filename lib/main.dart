import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/booksProvider.dart';
import 'package:shareyourbook/screens/AddBookScreen.dart';
import 'package:shareyourbook/screens/HomeScreen.dart';
import 'package:shareyourbook/screens/LoginScreen.dart';

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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.blue, fontFamily: "BalooTammudu2"),
        initialRoute: AddBookScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          AddBookScreen.id: (context) => AddBookScreen(),
        },
      ),
    );
  }
}
