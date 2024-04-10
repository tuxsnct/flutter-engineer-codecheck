import 'package:flutter_test/flutter_test.dart';

import '../../values/github_api.dart';
import '../robot/repository_detail_screen_robot.dart';

void main() {
  group(
    'RepositoryDetailScreen',
    () {
      testWidgets(
        'リポジトリ名が表示されること',
        (WidgetTester tester) async {
          final robot = RepositoryDetailScreenRobot(tester: tester);
          await robot.setup();

          final selectedRepository = searchRepositoriesModel.items[0];
          expect(find.text(selectedRepository.fullName), findsOneWidget);
        },
      );
    },
    skip: true,
  );
}
