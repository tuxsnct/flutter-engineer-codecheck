import 'package:github_viewer/api/github_api_client.dart';
import 'package:github_viewer/features/search/domain/datasources/remote/search_datasource.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

class SearchDatasourceImpl implements SearchDatasource {
  SearchDatasourceImpl(this.client);

  final GithubApiClient client;

  @override
  Future<SearchRepositoriesResponseModel> searchRepositories(String q) =>
      client.searchRepositories(q);
}
