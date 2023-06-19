import 'package:fl_audio_book/constants/Api.dart';
import 'package:fl_audio_book/models/ebook.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class BookService {
  final http.Client client;

  const BookService(this.client);

  Future<Book?> getPopularBooks() async {
    try {
      final uri = Uri.parse(ApiConst.books);
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        final books = Book(
          name: data['Popular list'][0]['name'],
          image: data['Popular list'][0]['image'],
          rate: data['Popular list'][0]['rate'],
          view: data['Popular list'][0]['view'],
          author: data['Popular list'][0]['author'],
        );

        // final books = Book.fromMap(data);

        return books;
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

final bookService = BookService(http.Client());
