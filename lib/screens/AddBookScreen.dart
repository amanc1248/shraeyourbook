import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:shareyourbook/constants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shareyourbook/httpmethods/book_http.dart';

class AddBookScreen extends StatefulWidget {
  static const String id = "AddBookScreen";
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final author = TextEditingController();
  final bookStatus = TextEditingController();
  final location = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  var pickedFile;
  Future pickImageFromGallery() async {
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
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
    AppBar appBar = AppBar(
      title: Text('Add Book'),
    );
    print(AppBar().preferredSize.height);
    print(MediaQuery.of(context).size.height);
    return ProgressHUD(
        child: Builder(
            builder: (context) => Scaffold(
                  appBar: appBar,
                  backgroundColor: Colors.white,
                  body: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  pickImageFromGallery();
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/reading.png")),
                                      color: Color(0xffC4C4C4),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                      child: Text("Tap to add book image")),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      decoration: BoxDecoration(
                                          color: Color(0xffFD0000)),
                                      child: Center(
                                        child: Text(
                                          "CANCEL",
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
                                        BookHttps().addBook(
                                            pickedFile,
                                            name.text,
                                            author.text,
                                            "available",
                                            location.text);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('Processing Data')));
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Color(0xff4267B2)),
                                        child: Center(
                                          child: Text(
                                            "PUBLISH",
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
                )));
  }
}
