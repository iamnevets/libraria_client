import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:libraria_user_app/api/bookApi.dart';
import 'package:libraria_user_app/controller/notifier/bookNotifier.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';
import 'package:libraria_user_app/model/books.model.dart';
import 'package:libraria_user_app/view/books/bookDetail.view.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    BookNotifier bookNotifier = Provider.of<BookNotifier>(context, listen: false);
    getBooks(bookNotifier);
    super.initState();

    setState(() {
      _allBooks = bookNotifier.bookList;
    });
  }

  List<Book> _allBooks = [];

  onSearched(String searchValue) {
    setState(() {
      BookNotifier bookNotifier = Provider.of<BookNotifier>(context, listen: false);
      _allBooks = bookNotifier.bookList.where((book) => book.title.toLowerCase().contains(searchValue)).toList() 
      + bookNotifier.bookList.where((book) => book.author.toLowerCase().contains(searchValue)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    BookNotifier bookNotifier = Provider.of<BookNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Container(
          height: 40,
          child: TextField(
            onChanged: (value) => onSearched(value),
            maxLines: 1,
            keyboardType: TextInputType.text,
            // controller: nameController,
            decoration: InputDecoration(
                fillColor: Colors.black.withAlpha(50),
                filled: true,
                contentPadding: EdgeInsets.all(0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                hintText: 'Search for book, author',
                prefixIcon: Icon(Icons.search)),
          ),
        ),
      ),
      body: _allBooks.isNotEmpty ? ListView.builder(
        itemCount: _allBooks.length,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  child: Image(
                    image: NetworkImage(_allBooks[index].coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(_allBooks[index].title),
                subtitle: Text(_allBooks[index].author),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookDetailView(selectedBook: _allBooks[index]);
                  }));
                },
              ),
              Divider()
            ],
          );
        },
      ) : Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 100, color: Colors.grey.withAlpha(70),),
          Text('No books found')
        ],
      )),
    );
  }
}
