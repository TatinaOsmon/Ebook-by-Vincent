import 'package:equatable/equatable.dart';
import 'package:fl_audio_book/models/ebook.dart';

class HomeState extends Equatable {
  final FetchStatus? status;
  final Book? popularList;

  const HomeState({
    this.status = FetchStatus.loading,
    this.popularList,
  });

  @override
  List<Object?> get props => [status, popularList];

  HomeState copyWith({
    FetchStatus? status,
    Book? popularList,
  }) {
    return HomeState(
      status: status ?? this.status,
      popularList: popularList ?? this.popularList,
    );
  }
}

enum FetchStatus { initial, loading, success, error }
