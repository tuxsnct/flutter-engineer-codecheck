import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/common/presentation/screens/home_screen.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';
import 'package:github_viewer/features/search/infrastructure/repositories/search_repository_impl.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

import '../../abstract/screen_robot.dart';
import '../../values/github_api.dart';
import 'search_result_screen_robot.mocks.dart';

class HomeScreenRobot
    with StatefulScreenRobot<HomeScreen, HomeScreenState>, ScreenSetupRobot
    implements ScreenRobot {
  HomeScreenRobot({required this.tester, this.container});

  @override
  final WidgetTester tester;

  @override
  final initialLocation = const HomeRoute().location;

  @override
  late GoRouter router;

  late final ProviderContainer? container;

  @override
  late final widget = UncontrolledProviderScope(
    container: container ?? ProviderContainer(),
    child: MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );

  Future<void> tapSearchButton() async {
    await tester.tap(find.byKey(const Key('top_search_bar')));
    await tester.pumpAndSettle();
  }

  Future<void> enterSearchWord(String searchWord) async {
    final viewTextField = find.descendant(
      of: find.byType(SafeArea),
      matching: find.byType(SearchBar),
    );
    await tester.enterText(viewTextField, 'hoge');
    await tester.pumpAndSettle();
  }

  static Future<SearchRepositoryImpl> setupMockRepository() async {
    final repository = MockSearchRepositoryImpl();
    final dummy = Success<SearchRepositoriesResponseModel, DioException>(
      searchRepositoriesModel,
    );
    provideDummy<Result<SearchRepositoriesResponseModel, DioException>>(
      dummy,
    );
    when(await repository.searchRepositories('hoge')).thenAnswer((_) => dummy);

    return repository;
  }
}
