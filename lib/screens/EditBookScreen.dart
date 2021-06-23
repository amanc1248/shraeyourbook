import 'package:flutter/material.dart';
import 'package:shareyourbook/constants/constants.dart';

class EditBookScreen extends StatefulWidget {
  static const String id = "EditBookScreen";
  const EditBookScreen({Key? key}) : super(key: key);

  @override
  _EditBookScreenState createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('Edit Book'),
    );
    double height = MediaQuery.of(context).size.height;
    print(AppBar().preferredSize.height);
    print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  child: Form(
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
                        ),
                      ],
                    ),
                  )),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
