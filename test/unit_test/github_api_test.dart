import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/api/github_api_client.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/search/infrastructure/datasources/remote/search_datasource_impl.dart';
import 'package:github_viewer/features/search/infrastructure/repositories/search_repository_impl.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../values/github_api.dart';
import 'github_api_test.mocks.dart';

@GenerateNiceMocks(
  [MockSpec<GithubApiClient>(), MockSpec<SearchDatasourceImpl>()],
)
void main() {
  group(
    'GithubApiClient',
    () {
      test('/search/repositoriesで想定のレスポンスを取得できる場合', () async {
        final dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));
        DioAdapter(dio: dio).onGet(
          '/search/repositories',
          (server) => server.reply(200, searchRepositoriesResponse),
        );

        final datasource = SearchDatasourceImpl(GithubApiClient(dio));
        final repository = SearchRepositoryImpl(datasource);
        final result = await repository.searchRepositories('flutter');
        final json = switch (result) {
          Success(value: final value) => value.toJson(),
          Failure() => null,
        };
        expect(json, searchRepositoriesResponse);
      });

      test('/search/repositoriesで想定のレスポンスを取得できない場合', () async {
        final datasource = MockSearchDatasourceImpl();

        when(datasource.searchRepositories('flutter')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/search/repositories'),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: '/search/repositories'),
            ),
          ),
        );

        final repository = SearchRepositoryImpl(datasource);
        final result = await repository.searchRepositories('flutter');
        final json = switch (result) {
          Success(value: final value) => value.toJson(),
          Failure() => null,
        };
        expect(json, null);
      });
    },
  );
}
