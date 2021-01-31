import 'package:flutter/material.dart';

// https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade
// Implement Navigator as stateful widget
class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class BooksApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  Book _selectedBook;
  bool show404 = false;
  final List<Book> books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Book('Foundation', 'Isaac Asimov'),
    Book('Fahrenheit 451', 'Ray Bradbury'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: BooksListScreen(
              books: books,
              onTapped: _bookTapped,
            ),
          ),
          if (show404)
            MaterialPage(
              key: ValueKey('UnknownPage'),
              child: UnknownScreen(),
            )
          else if (_selectedBook != null)
            MaterialPage(
              key: ValueKey(_selectedBook),
              child: BookDetailsScreen(book: _selectedBook),
            )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }

  void _bookTapped(Book book) {
    setState(() {
      _selectedBook = book;
      print("Selected book ${book.title}");
    });
  }
}

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListScreen({
    @required this.books,
    @required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books"),
      ),
      body: ListView(
        children: books
            .map((book) => ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  onTap: () => onTapped(book),
                ))
            .toList(),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${book.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (book != null) ...[
                Text(book.title, style: Theme.of(context).textTheme.headline6),
                Text(book.author, style: Theme.of(context).textTheme.subtitle1),
              ],
            ],
          ),
        )
      ),
    );
  }
}
