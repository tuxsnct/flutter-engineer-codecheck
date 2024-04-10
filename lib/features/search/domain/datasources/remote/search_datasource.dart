import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

abstract class SearchDatasource {
  Future<SearchRepositoriesResponseModel> searchRepositories(
    String q,
  );
}
