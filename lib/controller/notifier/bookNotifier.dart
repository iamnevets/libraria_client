import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:libraria_user_app/model/books.model.dart';

class BookNotifier with ChangeNotifier {
  List<Book> _bookList = [];
  late Book _currentBook;

  UnmodifiableListView<Book> get bookList => UnmodifiableListView(_bookList);
  Book get currentBook => _currentBook;

  set bookList(List<Book> bookList) {
    _bookList = bookList;
    notifyListeners();
  }

  set currentBook(Book book) {
    _currentBook = book;
    notifyListeners();
  }
}
