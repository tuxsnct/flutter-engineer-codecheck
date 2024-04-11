// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_colour/github_colour.dart';
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

@riverpod
Color githubColour(GithubColourRef ref, String? language) {
  GitHubColour? instance;

  try {
    instance = GitHubColour.getExistedInstance();
  } catch (e) {
    // テスト時にエラーが発生しないようにtry,catchを使用
  }

  return instance != null ? instance[language] : Colors.grey;
}
