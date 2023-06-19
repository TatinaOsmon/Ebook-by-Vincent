import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fl_audio_book/cubit/home_state.dart';

import 'package:fl_audio_book/service/home_service.dart';

class HomeCubit extends Cubit<HomeState> {
  final BookService bookService;

  HomeCubit(this.bookService) : super(const HomeState());

  Future<void> fetchBooks() async {
    try {
      final popularList = await bookService.getPopularBooks();

      emit(
        state.copyWith(status: FetchStatus.success, popularList: popularList),
      );
    } catch (e) {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
