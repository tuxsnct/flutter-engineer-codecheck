import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/providers.dart';

import '../../values/github_api.dart';
import '../robot/repository_detail_screen_robot.dart';

void main() {
  group(
    'RepositoryDetailScreen',
    () {
      final container = ProviderContainer(
        overrides: [
          githubColourProvider('Assembly')
              .overrideWithValue(const Color(0x006E4C13)),
        ],
      );

      testWidgets(
        'リポジトリ詳細が表示されること',
        (WidgetTester tester) async {
          final robot =
              RepositoryDetailScreenRobot(tester: tester, container: container);
          await robot.setup();

          final selectedRepository = searchRepositoriesModel.items[0];
          expect(find.text(selectedRepository.name), findsOneWidget);
          expect(find.text(selectedRepository.owner!.login), findsOneWidget);
          expect(find.text(selectedRepository.description!), findsOneWidget);
          expect(find.text(selectedRepository.language!), findsOneWidget);
          expect(
            find.text('${selectedRepository.stargazersCount} stars'),
            findsOneWidget,
          );
          expect(
            find.text('${selectedRepository.watchersCount} watching'),
            findsOneWidget,
          );
          expect(
            find.text('${selectedRepository.forksCount} forks'),
            findsOneWidget,
          );
          expect(
            find.text('${selectedRepository.openIssuesCount} opened issues'),
            findsOneWidget,
          );
        },
      );
    },
    skip: true,
  );
}
