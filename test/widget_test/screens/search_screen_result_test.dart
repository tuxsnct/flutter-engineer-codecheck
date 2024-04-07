import 'package:flutter_test/flutter_test.dart';

import '../robot/search_result_screen_robot.dart';

void main() {
  group(
    'SearchResultScreen',
    () {
      testWidgets(
        '検索ワードが表示されること',
        (WidgetTester tester) async {
          final robot = SearchResultScreenRobot(tester);
          await robot.setup();

          // 検索ワードが表示されていることを確認
          expect(find.text('hoge'), findsOneWidget);
        },
      );
    },
  );
}
