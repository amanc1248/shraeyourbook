import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shareyourbook/constants/constants.dart';
import 'package:shareyourbook/provider/yourBooksProvider.dart';

class EditBookScreen extends StatefulWidget {
  static const String id = "EditBookScreen";
  final int theIndex;
  EditBookScreen({required this.theIndex});
  @override
  _EditBookScreenState createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final author = TextEditingController();
  final bookStatus = TextEditingController();
  final location = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    name.text = Provider.of<YourBooksProvider>(context, listen: false)
        .yourBooks[widget.theIndex]
        .name;
    author.text = Provider.of<YourBooksProvider>(context, listen: false)
        .yourBooks[widget.theIndex]
        .author;
    bookStatus.text = Provider.of<YourBooksProvider>(context, listen: false)
        .yourBooks[widget.theIndex]
        .status;
    location.text = Provider.of<YourBooksProvider>(context, listen: false)
        .yourBooks[widget.theIndex]
        .location;
  }

  @override
  void dispose() {
    name.dispose();
    bookStatus.dispose();
    author.dispose();
    location.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as MyBooksScreen;

    AppBar appBar = AppBar(
      automaticallyImplyLeading: false,
      title: Text('Edit Book'),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Color(0xffC4C4C4),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(child: Text("Tap to add book image")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Book Details",
                                    style: kAddBookLableStyle,
                                  ))),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Book name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                            controller: name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Author",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            controller: author,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Book Status",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            controller: bookStatus,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Book Location",
                                    style: kAddBookLableStyle,
                                  ))),
                          Text(
                            "Please fill out the location to make interested reader find the book easily",
                            style: TextStyle(fontSize: 12),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Book Location",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                            controller: location,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(color: Color(0xffFD0000)),
                          child: Center(
                            child: Text(
                              "DELETE",
                              style: kAddBookButtonStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            print(name.text.toString());
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(color: Color(0xff4267B2)),
                            child: Center(
                              child: Text(
                                "SAVE",
                                style: kAddBookButtonStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
