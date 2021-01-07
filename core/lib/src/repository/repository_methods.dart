import 'package:core/core.dart';

/// The main repository class which will contains the
/// methods which needs to be override by the [LocalRepository] and
/// [RemoteRepository]. This will help by maintaining the same method
/// class in [LocalRepository], [RemoteRepository] and [RepositoryCalls].
abstract class RepositoryMethods {
  /// Returns the response for the searched query.
  ///
  /// [searchedQuery] : the searched text.
  Future<WikiSearchResponse> search(
    String searchedQuery,
  );
}
