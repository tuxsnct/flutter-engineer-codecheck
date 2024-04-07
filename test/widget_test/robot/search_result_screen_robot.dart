import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';
import 'package:go_router/go_router.dart';

import '../../abstract/screen_robot.dart';

class SearchResultScreenRobot with ScreenSetupRobot implements ScreenRobot {
  SearchResultScreenRobot(this.tester);

  @override
  final WidgetTester tester;

  @override
  final initialLocation = const SearchResultRoute('hoge').location;

  @override
  late GoRouter router;
}
