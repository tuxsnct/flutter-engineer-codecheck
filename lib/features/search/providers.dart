// coverage:ignore-file
import 'package:github_viewer/config/providers.dart';
import 'package:github_viewer/features/search/infrastructure/datasources/remote/search_datasource_impl.dart';
import 'package:github_viewer/features/search/infrastructure/repositories/search_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
SearchRepositoryImpl searchRepository(SearchRepositoryRef ref) {
  final githubApiClient = ref.watch(githubApiClientProvider);
  return SearchRepositoryImpl(SearchDatasourceImpl(githubApiClient));
}
