import 'package:dio/dio.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

abstract class GithubRepository {
  Future<Result<SearchRepositoriesResponseModel, DioException>>
      searchRepositories(String q);
}
