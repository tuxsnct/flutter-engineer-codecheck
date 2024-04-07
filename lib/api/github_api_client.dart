import 'package:dio/dio.dart' hide Headers;
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';
import 'package:retrofit/http.dart';

part 'github_api_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com')
abstract class GithubApiClient {
  factory GithubApiClient(Dio dio, {String baseUrl}) = _GithubApiClient;

  static const _headers = <String, dynamic>{
    'Content-Type': 'application/vnd.github+json',
    // TODO(tuxsnct): アクセストークンを設定する
    'Authorization': 'Bearer hoge',
  };

  @GET('/search/repositories')
  @Headers(_headers)
  Future<SearchRepositoriesResponseModel> searchRepositories(
    @Query('q') String q,
  );
}
