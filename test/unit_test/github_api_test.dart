import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/api/github_api_client.dart';
import 'package:github_viewer/features/common/infrastructure/datasources/remote/github_datasource_impl.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/common/infrastructure/repositories/github_repository_impl.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_api_test.mocks.dart';

final expectedResponse = {
  'total_count': 40,
  'incomplete_results': false,
  'items': [
    {
      'name': 'Tetris',
      'full_name': 'dtrupenn/Tetris',
      'owner': {
        'login': 'dtrupenn',
        'avatar_url':
            'https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png',
      },
      'stargazers_count': 1,
      'watchers_count': 1,
      'language': 'Assembly',
      'forks_count': 0,
      'open_issues_count': 0,
    }
  ],
};

final expectedModel =
    SearchRepositoriesResponseModel.fromJson(expectedResponse);

@GenerateNiceMocks(
  [MockSpec<GithubApiClient>(), MockSpec<GithubDatasourceImpl>()],
)
void main() {
  group(
    'GithubApiClient',
    () {
      test('/search/repositoriesで想定のレスポンスを取得できる場合', () async {
        final dio = Dio(BaseOptions(baseUrl: 'https://api.github.com'));
        DioAdapter(dio: dio).onGet(
          '/search/repositories',
          (server) => server.reply(200, expectedResponse),
        );

        final datasource = GithubDatasourceImpl(GithubApiClient(dio));
        final repository = GithubRepositoryImpl(datasource);
        final result = await repository.searchRepositories('flutter');
        final json = switch (result) {
          Success(value: final value) => value.toJson(),
          Failure() => null,
        };
        expect(json, expectedResponse);
      });

      test('/search/repositoriesで想定のレスポンスを取得できない場合', () async {
        final datasource = MockGithubDatasourceImpl();

        when(datasource.searchRepositories('flutter')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/search/repositories'),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(path: '/search/repositories'),
            ),
          ),
        );

        final repository = GithubRepositoryImpl(datasource);
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
