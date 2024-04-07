import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';

import '../robot/home_screen_robot.dart';

void main() {
  group(
    'HomeScreen',
    () {
      testWidgets(
        'タイトルと検索ボタンが表示されること',
        (WidgetTester tester) async {
          final robot = HomeScreenRobot(tester);
          await robot.setup();

          // タイトルが表示されていることを確認
          expect(find.byKey(const Key('title')), findsOneWidget);

          // 検索ボタンが表示されていることを確認
          expect(find.byKey(const Key('search_button')), findsOneWidget);
        },
      );

      testWidgets(
        '検索ボタンから検索画面を表示されること',
        (WidgetTester tester) async {
          final robot = HomeScreenRobot(tester);
          await robot.setup();

          // 検索ボタンをタップ
          await robot.tapSearchButton();

          // 検索画面が表示されていることを確認
          final state = await robot.state;
          expect(state.controller.isOpen, isTrue);
        },
      );

      testWidgets(
        '検索画面にて、入力後に表示されたサジェストをタップして検索結果画面に遷移されること',
        (WidgetTester tester) async {
          final robot = HomeScreenRobot(tester);
          await robot.setup();

          // 検索ボタンをタップ
          await robot.tapSearchButton();

          // 検索ワードを入力
          await robot.enterSearchWord('hoge');

          // サジェストが表示されていることを確認
          final suggestion = find.byType(ListTile);
          expect(suggestion, findsOneWidget);

          // サジェストをタップ
          await tester.tap(suggestion);
          await tester.pumpAndSettle();

          // 検索結果画面に遷移されていることを確認
          expect(
            robot.router.location,
            const SearchResultRoute('hoge').location,
          );
        },
      );

      testWidgets(
        '検索画面にて、入力後にエンターを入力して検索結果画面に遷移されること',
        (WidgetTester tester) async {
          final robot = HomeScreenRobot(tester);
          await robot.setup();

          // 検索ボタンをタップ
          await robot.tapSearchButton();

          // 検索ワードを入力
          await robot.enterSearchWord('hoge');

          // エンターを入力
          await tester.testTextInput.receiveAction(TextInputAction.search);
          await tester.pumpAndSettle();

          // 検索結果画面に遷移されていることを確認
          expect(
            robot.router.location,
            const SearchResultRoute('hoge').location,
          );
        },
      );

      testWidgets(
        '検索画面にて、戻るボタンをタップして検索画面が閉じられること',
        (WidgetTester tester) async {
          final robot = HomeScreenRobot(tester);
          await robot.setup();

          // 検索ボタンをタップ
          await robot.tapSearchButton();

          // 戻るボタンをタップ
          await tester.tap(find.byIcon(Icons.arrow_back));
          await tester.pumpAndSettle();

          // 検索画面が閉じられていることを確認
          final state = await robot.state;
          expect(state.controller.isOpen, isFalse);
        },
      );
    },
  );
}
