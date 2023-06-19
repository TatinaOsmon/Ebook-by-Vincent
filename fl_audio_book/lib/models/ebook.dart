class Book {
  const Book({
    required this.name,
    required this.image,
    required this.rate,
    required this.view,
    required this.author,
  });

  final String name;
  final String image;
  final double rate;
  final String view;
  final String author;

  factory Book.fromMap(Map<String, dynamic> json) {
    return Book(
      name: json['name'] as String,
      image: json['image'] as String,
      rate: json['rate'] as double,
      view: json['view'] as String,
      author: json['author'] as String,
    );
  }
}

class Books {
  const Books({required this.popularList});

  final List<Book> popularList;

  factory Books.fromMap(Map<String, dynamic> map) {
    return Books(
      popularList: List<Book>.from(
        (map['Popular list'] as List<dynamic>).map<Book>(
          (x) => Book.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
