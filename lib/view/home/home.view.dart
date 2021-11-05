import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:libraria_user_app/api/bookApi.dart';
import 'package:libraria_user_app/controller/notifier/bookNotifier.dart';
import 'package:libraria_user_app/design_system/appBarTop/appBarTop.ds.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';
import 'package:libraria_user_app/model/books.model.dart';
import 'package:libraria_user_app/view/books/bookDetail.view.dart';
import 'package:libraria_user_app/view/profile/profile.view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    BookNotifier bookNotifier = Provider.of<BookNotifier>(context, listen: false);
    getBooks(bookNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BookNotifier bookNotifier = Provider.of<BookNotifier>(context);

    return Scaffold(
      appBar: libHomeAppBarLight('Home', [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.account_circle_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfileView();
              }));
            },
          ),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trendingBooks.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Hero(
                      tag: trendingBooks[index].title,
                      child: Stack(
                        children: [
                          Text(''),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            height: 200,
                            width: 300,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.hardEdge,
                                child: Image(
                                  image: AssetImage(trendingBooks[index].coverImage),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.all(30),
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Headline6(title: trendingBooks[index].title),
                                TextBody1(title: trendingBooks[index].author),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bookNotifier.bookList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Hero(
                    tag: bookNotifier.bookList[index].title,
                    child: GestureDetector(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 170,
                            color: Colors.grey.shade200,
                            child: Image(
                              image: NetworkImage(bookNotifier.bookList[index].coverImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              bookNotifier.bookList[index].title,
                              style: TextStyle(fontSize: 24),
                            ),
                            subtitle: Text(bookNotifier.bookList[index].author),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return BookDetailView(selectedBook: bookNotifier.bookList[index]);
                        }));
                      },
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
