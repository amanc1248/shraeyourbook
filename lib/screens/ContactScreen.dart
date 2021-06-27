import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/httpmethods/user_http.dart';
import 'package:shareyourbook/model/contactModel.dart';
import 'package:shareyourbook/provider/userProvider.dart';

class ContactScreen extends StatefulWidget {
  static const String id = "ContactScreen";
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<String> theLinks = [];
  List<String> linksText = ["contact through fb", "write an email"];
  List<String> theImages = [
    "assets/images/facebook.jpg",
    "assets/images/gmail.png",
  ];
  @override
  void initState() {
    super.initState();
    // theLinks
    //     .add(Provider.of<UserProvider>(context, listen: false).userInfo.fbLink);
    // theLinks
    //     .add(Provider.of<UserProvider>(context, listen: false).userInfo.gmail);
  }

  getUserById() async {
    // final result =  await UserHttps().getUserById(gmaillink)
  }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ContactModel;
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    theLinks = [args.fblink, args.gmaillink];
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact " + args.name),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: theLinks.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage(theImages[index]),
                  height: 50,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(linksText[index])
              ],
            ),
          );
        },
      ),
    );
  }
}
