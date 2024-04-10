// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:github_viewer/api/github_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio()..interceptors.add(LogInterceptor());
}

@riverpod
GithubApiClient githubApiClient(GithubApiClientRef ref) {
  return GithubApiClient(ref.watch(dioProvider));
}
