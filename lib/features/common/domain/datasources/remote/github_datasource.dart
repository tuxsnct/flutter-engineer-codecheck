import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

abstract class GithubDatasource {
  Future<SearchRepositoriesResponseModel> searchRepositories(
    String q,
  );
}
