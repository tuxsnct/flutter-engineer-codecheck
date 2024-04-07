import 'package:github_viewer/api/github_api_client.dart';
import 'package:github_viewer/features/common/domain/datasources/remote/github_datasource.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

class GithubDatasourceImpl implements GithubDatasource {
  GithubDatasourceImpl(this.client);

  final GithubApiClient client;

  @override
  Future<SearchRepositoriesResponseModel> searchRepositories(String q) =>
      client.searchRepositories(q);
}
