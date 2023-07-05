import 'package:fl_audio_book/models/ebook.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fl_audio_book/cubit/home_state.dart';

import 'package:fl_audio_book/service/home_service.dart';

// class HomeCubit extends Cubit<HomeState> {
//   final BookService bookService;

//   HomeCubit(this.bookService) : super(const HomeState());

//   Future<void> fetchBooks() async {
//     try {
//       // final popularList = await bookService.getPopularBooks();
//       final bookData = await bookService.getBooks();

//       // emit(
//       //   state.copyWith(status: FetchStatus.success, popularList: popularList),
//       emit(
//         state.copyWith(status: FetchStatus.success, books: bookData),
//       );

//     } catch (e) {
//       emit(state.copyWith(status: FetchStatus.error));
//     }
//   }
// }

class HomeCubit extends Cubit<HomeState> {
  final BookService bookService;

  HomeCubit(this.bookService) : super(const HomeState());

  Future<void> fetchBooks() async {
    try {
      final Books? booksData = await bookService.getBooks();

      if (booksData != null) {
        emit(
          state.copyWith(status: FetchStatus.success, books: booksData),
        );
      } else {
        emit(state.copyWith(status: FetchStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
