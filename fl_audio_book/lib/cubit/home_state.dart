import 'package:equatable/equatable.dart';
import 'package:fl_audio_book/models/ebook.dart';

class HomeState extends Equatable {
  final FetchStatus? status;
  final Books? books;

  const HomeState({
    this.status = FetchStatus.loading,
    this.books,
  });

  @override
  List<Object?> get props => [status, books];

  HomeState copyWith({
    FetchStatus? status,
    Books? books,
  }) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
    );
  }
}

enum FetchStatus { initial, loading, success, error }
