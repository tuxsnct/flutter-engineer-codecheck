import 'package:dio/dio.dart';
import 'package:github_viewer/features/common/domain/datasources/remote/github_datasource.dart';
import 'package:github_viewer/features/common/domain/repositories/github_repository.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

class GithubRepositoryImpl implements GithubRepository {
  GithubRepositoryImpl(this.datasource);

  final GithubDatasource datasource;

  @override
  Future<Result<SearchRepositoriesResponseModel, DioException>>
      searchRepositories(
    String q,
  ) {
    try {
      return datasource.searchRepositories(q).then(Success.new);
    } on DioException catch (e) {
      return Future.value(Failure(e));
    }
  }
}
