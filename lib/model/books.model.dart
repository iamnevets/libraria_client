class Book {
  String id = '';
  String title = '';
  String coverImage = '';
  List<dynamic> genre = [];
  String isbn = '';
  String author = '';
  String publisher = '';
  String description = '';
  String year = '0';
  String edition = '';

  Book.fromMap(Map<String, dynamic> bookData) {
    id = bookData['id'];
    title = bookData['title'];
    genre = bookData['genre'];
    author = bookData['author'];
    year = bookData['year'];
    isbn = bookData['ISBN'];
    edition = bookData['edition'];
    publisher = bookData['publisher'];
    description = bookData['description'];
    coverImage = bookData['coverImage'];
  }

  Book({
    required this.id,
    required this.coverImage,
    required this.title,
    required this.genre,
    required this.author,
    required this.publisher,
    required this.year,
    required this.isbn,
    required this.edition,
  });
}

List<Book> listOfBooks = [
  Book(
      id: '1',
      coverImage: 'assets/img/gods-are-not-to-blame.jpg',
      title: 'The Gods are not to Blame',
      genre: ['Drama',],
      author: 'Ola Rotimi',
      publisher: "Eden Press",
      year: '1982',
      edition: 'Illustrated',
      isbn: '012812095780ad0h10'),
  Book(
      id: '2',
      coverImage: 'assets/img/the-beautyful-ones-are-not-yet-born.jpg',
      title: 'The Beautyful Ones are not Yet Born',
      genre: ['Literature',],
      author: 'Ama Ataa Aidoo',
      publisher: 'African Writers Series',
      year: '2002',
      edition: 'Revised',
      isbn: '012812095780ad0h10'),
  Book(
      id: '3',
      coverImage: 'assets/img/arrow-of-god.jpg',
      title: 'So Long a Letter',
      genre: ['Literature',],
      author: 'Mariama Ba',
      publisher: 'Genome Press',
      year: '1998',
      edition: 'Revised',
      isbn: '012812095780ad0h10'),
  Book(
      id: '4',
      coverImage: 'assets/img/arrow-of-god.jpg',
      title: 'Arrow of God',
      genre: ['Literature',],
      author: 'Chinua Achebe',
      publisher: 'Genome Press',
      year: '1998',
      edition: 'Revised',
      isbn: '012812095780ad0h10'),
];

List<Book> trendingBooks = [
  Book(
      id: '1',
      coverImage: 'assets/img/gods-are-not-to-blame.jpg',
      title: 'The Gods are not to Blame',
      genre: ['Drama',],
      author: 'Ola Rotimi',
      publisher: "Eden Press",
      year: '1982',
      edition: 'Illustrated',
      isbn: '012812095780ad0h10'),
  Book(
      id: '2',
      coverImage: 'assets/img/the-beautyful-ones-are-not-yet-born.jpg',
      title: 'The Beautyful Ones are not Yet Born',
      genre: ['Literature',],
      author: 'Ama Ataa Aidoo',
      publisher: 'African Writers Series',
      year: '2002',
      edition: 'Revised',
      isbn: '012812095780ad0h10'),
];
