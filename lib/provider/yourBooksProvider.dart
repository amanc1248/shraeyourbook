import 'package:flutter/cupertino.dart';
import 'package:shareyourbook/model/bookModel.dart';

class YourBooksProvider with ChangeNotifier {
  List<BookModel> _yourBooks = [];
  List<BookModel> get yourBooks => _yourBooks;
  set yourBooks(List<BookModel> yourBooks) {
    _yourBooks = yourBooks;
    notifyListeners();
  }
}
