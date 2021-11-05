import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libraria_user_app/controller/notifier/bookNotifier.dart';
import 'package:libraria_user_app/model/books.model.dart';

getBooks(BookNotifier bookNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('books').get();
  List<Book> _bookList = [];

  snapshot.docs.forEach((doc) {
    Book book = Book.fromMap(doc.data() as Map<String, dynamic>);
    _bookList.add(book);
  });

  bookNotifier.bookList = _bookList;
}
