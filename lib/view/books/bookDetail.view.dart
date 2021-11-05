import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:libraria_user_app/design_system/color.ds.dart';
import 'package:libraria_user_app/design_system/typography.ds.dart';
import 'package:libraria_user_app/model/books.model.dart';

class BookDetailView extends StatelessWidget {
  BookDetailView({Key? key, required this.selectedBook}) : super(key: key);

  Book selectedBook;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: lightPrimaryColor),
        elevation: 0,
        backgroundColor: transparentColor,
      ),
      body: SingleChildScrollView(
        child: Hero(
          tag: selectedBook.isbn, 
          child: Column( 
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image(
                  image: NetworkImage(selectedBook.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 children: [
                    Headline5(
                  title: selectedBook.title,
                ),
                SizedBox(height: 20,),
                Text(selectedBook.description, style: TextStyle(fontSize: 18, color: Colors.grey.shade800),),
                SizedBox(height: 20,),
                ListTile(
                  leading: Icon(Icons.person_outlined),
                  title: Text(selectedBook.author),
                  subtitle: Text('Author'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text(selectedBook.isbn),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                      children: selectedBook.genre.map((genre) => 
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ActionChip(
                            onPressed: (){},
                            backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(20),
                            label: Text(genre),
                          ),
                        ),
                      ).toList(),
                    ),
                ),
                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
