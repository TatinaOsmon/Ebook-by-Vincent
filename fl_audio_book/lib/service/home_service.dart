import 'package:fl_audio_book/constants/api.dart';
import 'package:fl_audio_book/models/ebook.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

// class BookService {
//   final http.Client client;

//   const BookService(this.client);

//   Future<List<Books>?> getBooks() async {
//     try {
//       final uri = Uri.parse(ApiConst.books);
//       final response = await client.get(uri);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = json.decode(response.body);
//         final booksData = data['books'];

//         final List<Books> books = booksData.map<Book>((bookData) => Book.fromMap(bookData)).toList();

//         return books;
//       } else {
//         log('${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }
// }

// class BookService {
//   final http.Client client;

//   const BookService(this.client);

//   Future<Books?> getBooks() async {
//     try {
//       final uri = Uri.parse(ApiConst.books);
//       final response = await client.get(uri);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = json.decode(response.body);
//         final books = Book(
//           name: data['Popular list'][0]['name'],
//           image: data['Popular list'][0]['image'],
//           rate: data['Popular list'][0]['rate'],
//           view: data['Popular list'][0]['view'],
//           author: data['Popular list'][0]['author'],
//         );

//         // final books = Books.fromMap(data);

//         return books;
//       } else {
//         log('${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }
//}

class BookService {
  final http.Client client;

  const BookService(this.client);

  Future<Books?> getBooks() async {
    try {
      final uri = Uri.parse(ApiConst.books);
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final booksData = Books.fromMap(data);

        return booksData;
      } else {
        log('${response.statusCode}');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
