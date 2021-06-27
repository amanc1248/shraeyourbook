import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shareyourbook/constants/constants.dart';
import 'package:shareyourbook/model/bookModel.dart';

class BookHttps {
  getBooksDetails() async {
    List<BookModel> _bookList = [];
    var url = "http://$localHost:3000/books";
    final http.Response response = await http.get(Uri.parse(url),
        headers: {"Content-Type": "application/json; charset=UTF-8"});
    var bookDetails = jsonDecode(response.body);

    for (var bookDetail in bookDetails) {
      BookModel bookModel = BookModel(
        id: bookDetail["id"],
        image: bookDetail["image"],
        name: bookDetail["name"],
        author: bookDetail["author"],
        status: bookDetail["status"],
        location: bookDetail["location"],
        ownerId: bookDetail["ownerId"],
        ownerName: bookDetail["ownerName"],
        fblink: bookDetail["fblink"],
      );

      _bookList.add(bookModel);
    }
    return _bookList;
  }

  getBooKDetailsById(bookId) async {
    var url = "http://$localHost:3000/books?$bookId";
    final http.Response response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=UTF-8",
    });
    var bookDetails = jsonDecode(response.body);
    BookModel bookModel = BookModel(
      id: bookDetails["id"],
      image: bookDetails["image"],
      name: bookDetails["name"],
      author: bookDetails["author"],
      status: bookDetails["status"],
      location: bookDetails["location"],
      ownerId: bookDetails["ownerId"],
      ownerName: bookDetails["ownerName"],
      fblink: bookDetails["fblink"],
    );
    return bookModel;
  }

  addBook(image, name, author, status, location) async {
    var url = "http://$localHost:3000/books/add-book";
    final http.Response response = await http.post(
      Uri.parse(url),
      body: {
        "image": image,
        "name": name,
        "author": author,
        "status": status,
        "location": location,
      },
    );
    print(response.body);
  }

  editBookDetails(id, image, name, author, status, location) async {
    var url = "http://$localHost:3000/books/edit/$id";
    final http.Response response = await http.patch(Uri.parse(url), body: {
      "image": image,
      "name": name,
      "author": author,
      "status": status,
      "location": location,
    });
    print(response.body);
  }
}
