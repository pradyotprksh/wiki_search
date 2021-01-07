import 'package:core/core.dart' as core;
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

/// A rest client which will help us to connect to the [core.NetworkConstants.baseUrl]
/// with the different options for connection. Will also contains
/// all the end points of the [core.NetworkConstants.baseUrl].
@RestApi(baseUrl: core.NetworkConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(
      sendTimeout: 3500,
      connectTimeout: 5000,
      receiveTimeout: 3500,
    );
    dio.interceptors.add(core.LogInterceptors());
    return _RestClient(dio, baseUrl: baseUrl);
  }

  @GET(
      '/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=250&pilimit=20&wbptterms=description&gpslimit=100')
  Future<core.WikiSearchResponse> search(
    @Query('gpssearch') String searchedQuery,
  );
}
