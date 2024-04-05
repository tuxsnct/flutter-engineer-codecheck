import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/main.dart';

void main() {
  testWidgets('HomeScreenにタイトルと検索ボタンが表示されること', (WidgetTester tester) async {
    await tester.pumpWidget(const GithubViewerApp());

    // タイトルが表示されていることを確認
    expect(find.byKey(const Key('title')), findsOneWidget);

    // 検索ボタンが表示されていることを確認
    expect(find.byKey(const Key('search_button')), findsOneWidget);
  });
}
