import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  static const String id = "AddBookScreen";
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Book"),
      ),
      body: Column(
        children: [
          Container(
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
                  Text("Book Details"),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Book name",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Author",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Book Status",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
