import 'package:flutter/cupertino.dart';
import 'package:shareyourbook/model/bookModel.dart';

class BooksProvider with ChangeNotifier {
  List<BookModel> _books = [
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Shared",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Available",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Available",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Shared",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Available",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Available",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Available",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
    BookModel(
        id: 1,
        image: "assets/images/reading.png",
        name: "Code of Extraordinary Mind",
        author: "Vishen Lekhani",
        status: "Shared",
        location: "Duhabi",
        ownerId: 1,
        ownerName: "Aman"),
  ];
  List<BookModel> get books => _books;
  set books(List<BookModel> books) {
    _books = books;
    notifyListeners();
  }
}
