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
                    Text(userProvider.userInfo.name)
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
                    EditContactDetails(
                        image: "assets/images/facebook.jpg",
                        link: userProvider.userInfo.fbLink),
                    EditContactDetails(
                        image: "assets/images/insta.jpg",
                        link: userProvider.userInfo.fbLink),
                    EditContactDetails(
                        image: "assets/images/google.jpg",
                        link: userProvider.userInfo.fbLink),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EditContactDetails extends StatefulWidget {
  final String image;
  String link;
  EditContactDetails({required this.image, required this.link});

  @override
  _EditContactDetailsState createState() => _EditContactDetailsState();
}

class _EditContactDetailsState extends State<EditContactDetails> {
  bool isEditingText = false;
  TextEditingController? _editingController;
  // String? initialText;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: widget.link);
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Image(
              image: AssetImage(widget.image),
              height: 50,
            ),
          ),
          isEditingText
              ? Expanded(
                  child: TextField(
                    onSubmitted: (newValue) {
                      setState(() {
                        widget.link = newValue;
                        isEditingText = false;
                      });
                    },
                    autofocus: true,
                    controller: _editingController,
                  ),
                )
              : Expanded(child: Text(widget.link)),
          TextButton(
              onPressed: () {
                setState(() {
                  isEditingText = !isEditingText;
                });
              },
              child: Text(isEditingText ? "SAVE" : "EDIT"))
        ],
      ),
    );
  }
}
