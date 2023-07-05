class Book {
  final String name;
  final String image;
  final double rate;
  //final String view;
  final String author;
  final String description;
  final String readLink;
  // final String listenLink;

  Book({
    required this.name,
    required this.image,
    required this.rate,
    // required this.view,
    required this.author,
    required this.description,
    required this.readLink,
    // required this.listenLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      image: json['image'],
      rate: json['rate'].toDouble(),
      // view: json['view'],
      author: json['author'],
      description: json['description'],
      readLink: json['readLink'],
      //listenLink: json['listenLink'],
    );
  }
  String password = 'Sayhong123';
}

// books.dart

class Books {
  final List<Book> popularList;
  final List<Book> recommendedList;
  final List<Book> newReleasesList;
  final List<Book> classicList;
  final List<Book> romanticList;
  final List<Book> artList;

  Books({
    required this.popularList,
    required this.recommendedList,
    required this.newReleasesList,
    required this.classicList,
    required this.romanticList,
    required this.artList,
  });

  factory Books.fromMap(Map<String, dynamic> map) {
    return Books(
      popularList: List<Book>.from(
        (map['Popular list'] as List<dynamic>).map<Book>(
          (x) => Book.fromJson(x as Map<String, dynamic>),
        ),
      ),
      recommendedList: List<Book>.from(
        (map['Recommended for you'] as List<dynamic>).map<Book>(
          (x) => Book.fromJson(x as Map<String, dynamic>),
        ),
      ),
      newReleasesList: List<Book>.from(
        (map['New release'] as List<dynamic>).map<Book>(
          (x) => Book.fromJson(x as Map<String, dynamic>),
        ),
      ),
      classicList: (map['Classic list'] as List<dynamic>?)
              ?.map<Book>((x) => Book.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
      romanticList: (map['Romantic list'] as List<dynamic>?)
              ?.map<Book>((x) => Book.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
      artList: (map['Art list'] as List<dynamic>?)
              ?.map<Book>((x) => Book.fromJson(x as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
