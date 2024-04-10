import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/search/infrastructure/datasources/remote/search_datasource_impl.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';
import 'package:github_viewer/features/search/infrastructure/repositories/search_repository_impl.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../abstract/screen_robot.dart';
import '../../values/github_api.dart';
import 'search_result_screen_robot.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SearchDatasourceImpl>(),
  MockSpec<SearchRepositoryImpl>(),
])
class SearchResultScreenRobot with ScreenSetupRobot implements ScreenRobot {
  SearchResultScreenRobot({required this.tester, this.container});

  @override
  final WidgetTester tester;

  @override
  late Widget widget = UncontrolledProviderScope(
    container: container ?? ProviderContainer(),
    child: MaterialApp.router(routerConfig: router),
  );

  final ProviderContainer? container;

  @override
  final initialLocation = const SearchResultRoute('hoge').location;

  @override
  late GoRouter router;

  static Future<SearchRepositoryImpl> setupMockRepository() async {
    final repository = MockSearchRepositoryImpl();

    final dummy = Success<SearchRepositoriesResponseModel, DioException>(
      searchRepositoriesModel,
    );
    provideDummy<Result<SearchRepositoriesResponseModel, DioException>>(
      dummy,
    );
    // デフォルトは成功しているものとする
    when(await MockSearchRepositoryImpl().searchRepositories('hoge'))
        .thenAnswer((_) => dummy);

    return repository;
  }
}
