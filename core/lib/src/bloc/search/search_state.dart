import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

/// A state of the application after the bloc
/// executes the events.
class SearchState extends Equatable {
  const SearchState({
    this.searchStatus = SearchStatus.idle,
    this.errorMessage = '',
  });

  final SearchStatus searchStatus;
  final String errorMessage;

  SearchState copyWith({
    SearchStatus searchStatus,
    String errorMessage,
  }) =>
      SearchState(
        searchStatus: searchStatus ?? this.searchStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [searchStatus];
}
