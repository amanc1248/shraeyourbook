import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  static const String id = "ContactScreen";
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<String> theLinks = [
    "www.facebook.com",
    "www.insta.com",
    "www.gmail.com"
  ];
  List<String> linksText = [
    "contact through fb",
    "dm in insta",
    "write an email"
  ];
  List<String> theImages = [
    "assets/images/facebook.jpg",
    "assets/images/insta.jpg",
    "assets/images/gmail.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Sudeep"),
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
