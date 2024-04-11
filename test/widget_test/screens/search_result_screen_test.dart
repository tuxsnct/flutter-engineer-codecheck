import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/common/presentation/widgets/status_indicator.dart';
import 'package:github_viewer/features/search/infrastructure/models/search_repositories_model.dart';
import 'package:github_viewer/features/search/presentation/widgets/repository_card.dart';
import 'package:github_viewer/features/search/providers.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../values/github_api.dart';
import '../robot/search_result_screen_robot.dart';
import '../robot/search_result_screen_robot.mocks.dart';

void main() {
  group(
    'SearchResultScreen',
    () {
      testWidgets(
        '検索ワードが表示されること',
        (WidgetTester tester) async {
          final repository =
              await SearchResultScreenRobot.setupMockRepository();
          final robot = SearchResultScreenRobot(
            tester: tester,
            container: ProviderContainer(
              overrides: [
                searchRepositoryProvider.overrideWithValue(repository),
              ],
            ),
          );
          await mockNetworkImagesFor(robot.setup);

          // 検索ワードが表示されていることを確認
          expect(
            find.descendant(
              of: find.byKey(const Key('result_search_bar')),
              matching: find.text('hoge'),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'リポジトリ一覧が表示されること',
        (WidgetTester tester) async {
          final repository =
              await SearchResultScreenRobot.setupMockRepository();
          final robot = SearchResultScreenRobot(
            tester: tester,
            container: ProviderContainer(
              overrides: [
                searchRepositoryProvider.overrideWithValue(repository),
              ],
            ),
          );
          await mockNetworkImagesFor(robot.setup);

          // 検索結果が表示されていることを確認
          expect(find.byType(RepositoryCard), findsOneWidget);
        },
      );

      testWidgets(
        '検索結果に適合するリポジトリが存在しない時にワーニングが表示されること',
        (WidgetTester tester) async {
          final repository = MockSearchRepositoryImpl();
          const dummy = Success<SearchRepositoriesResponseModel, DioException>(
            SearchRepositoriesResponseModel(
              totalCount: 0,
              incompleteResults: false,
              items: [],
            ),
          );
          provideDummy<Result<SearchRepositoriesResponseModel, DioException>>(
            dummy,
          );
          final robot = SearchResultScreenRobot(
            tester: tester,
            container: ProviderContainer(
              overrides: [
                searchRepositoryProvider.overrideWithValue(repository),
              ],
            ),
          );
          await mockNetworkImagesFor(robot.setup);

          // 検索結果が表示されていることを確認
          expect(find.byType(WarningIndicator), findsOneWidget);
        },
      );

      testWidgets('エラー時にRetryボタンを押して、リトライが行われること', (WidgetTester tester) async {
        final repository = await SearchResultScreenRobot.setupMockRepository();
        when(await repository.searchRepositories('hoge'))
            .thenThrow(Exception());
        final robot = SearchResultScreenRobot(
          tester: tester,
          container: ProviderContainer(
            overrides: [
              searchRepositoryProvider.overrideWithValue(repository),
            ],
          ),
        );
        await robot.setup();

        await tester.tap(
          find.descendant(
            of: find.byType(ElevatedButton),
            matching: find.text('Retry'),
          ),
        );
        await tester.pumpAndSettle();
      });

      testWidgets('Github Viewerをタップしてホーム画面に遷移されること',
          (WidgetTester tester) async {
        final repository = await SearchResultScreenRobot.setupMockRepository();
        final robot = SearchResultScreenRobot(
          tester: tester,
          container: ProviderContainer(
            overrides: [
              searchRepositoryProvider.overrideWithValue(repository),
            ],
          ),
        );
        await robot.setup();

        await tester.tap(find.text('Github Viewer'));
        await tester.pumpAndSettle();

        expect(robot.router.location, const HomeRoute().location);
      });

      testWidgets(
        'リポジトリカードをタップして、リポジトリ詳細画面に遷移されること',
        (WidgetTester tester) async {
          final repository =
              await SearchResultScreenRobot.setupMockRepository();
          final robot = SearchResultScreenRobot(
            tester: tester,
            container: ProviderContainer(
              overrides: [
                searchRepositoryProvider.overrideWithValue(repository),
              ],
            ),
          );
          await mockNetworkImagesFor(robot.setup);

          // リポジトリカードをタップ
          await tester.tap(find.byType(RepositoryCard).first);
          await tester.pumpAndSettle();

          // リポジトリ詳細画面に遷移されていることを確認
          final selectedRepository = searchRepositoriesModel.items[0];
          expect(
            robot.router.location,
            RepositoryDetailRoute($extra: selectedRepository).location,
          );
        },
      );
    },
  );
}
