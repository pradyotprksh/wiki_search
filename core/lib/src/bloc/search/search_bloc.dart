import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as get_controller;

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState());

  final RepositoryCalls _repositoryCalls = get_controller.Get.find();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchQueryChange) {
      yield* _mapQueryChangeToState(event);
    }
  }

  /// Yields the steam of [SearchState] depending on the event.
  ///
  /// [event] : the query change event.
  Stream<SearchState> _mapQueryChangeToState(SearchQueryChange event) async* {
    yield state.copyWith(
      searchStatus: SearchStatus.loading,
    );
    try {
      await _repositoryCalls.search(event.query);
    } on DioError catch (exception) {
      yield state.copyWith(
        searchStatus: SearchStatus.error,
        errorMessage: exception.message,
      );
    } catch (exception) {
      yield state.copyWith(
        searchStatus: SearchStatus.error,
        errorMessage: exception.toString(),
      );
    }
  }
}