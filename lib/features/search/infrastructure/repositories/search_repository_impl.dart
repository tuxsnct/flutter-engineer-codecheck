import 'package:dio/dio.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/search/domain/datasources/remote/search_datasource.dart';
import 'package:github_viewer/features/search/domain/repositories/search_repository.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this.datasource);

  final SearchDatasource datasource;

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
