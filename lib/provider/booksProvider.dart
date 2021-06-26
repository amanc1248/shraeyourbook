import 'package:flutter/cupertino.dart';
import 'package:shareyourbook/httpmethods/book_http.dart';
import 'package:shareyourbook/model/bookModel.dart';

class BooksProvider with ChangeNotifier {
  List<BookModel> _books = [];
  List<BookModel> get books => _books;
  set books(List<BookModel> books) {
    _books = books;
    notifyListeners();
  }

  getAllBooksFromDB() async {
    _books = await BookHttps().getBooksDetails();
    notifyListeners();
  }
}
