import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/provider/booksProvider.dart';
import 'package:shareyourbook/provider/userProvider.dart';
import 'package:shareyourbook/provider/yourBooksProvider.dart';
import 'package:shareyourbook/screens/AddBookScreen.dart';
import 'package:shareyourbook/screens/ContactScreen.dart';
import 'package:shareyourbook/screens/HomeScreen.dart';
import 'package:shareyourbook/screens/LoginScreen.dart';
import 'package:shareyourbook/screens/facebookConnectScreen.dart';
import 'package:shareyourbook/widgets/bottomNavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
        // initialRoute: FacebookConnectScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          FacebookConnectScreen.id: (context) => FacebookConnectScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          AddBookScreen.id: (context) => AddBookScreen(),
          // MyBooksScreen.id: (context) => MyBooksScreen(),
          ContactScreen.id: (context) => ContactScreen(),
          BottomNavigation.id: (context) => BottomNavigation(),
        },
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    checkTheLoggedInStatus();
  }

  void checkTheLoggedInStatus() async {
    final result =
        await Provider.of<UserProvider>(context, listen: false).getUserData();
    print(result);
    if (result != 'null') {
      Provider.of<UserProvider>(context, listen: false).userInfo.gmail = result;

      Navigator.pushNamedAndRemoveUntil(
          context, BottomNavigation.id, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.id, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
