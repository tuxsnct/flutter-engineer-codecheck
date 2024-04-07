import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';
import 'package:github_viewer/features/common/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../abstract/screen_robot.dart';

class HomeScreenRobot
    with StatefulScreenRobot<HomeScreen, HomeScreenState>, ScreenSetupRobot
    implements ScreenRobot {
  HomeScreenRobot(this.tester);

  @override
  final WidgetTester tester;

  @override
  final initialLocation = const HomeRoute().location;

  @override
  late GoRouter router;

  Future<void> tapSearchButton() async {
    await tester.tap(find.byKey(const Key('search_button')));
    await tester.pumpAndSettle();
  }

  Future<void> enterSearchWord(String searchWord) async {
    await tester.enterText(find.byType(TextField), searchWord);
    await tester.pumpAndSettle();
  }
}
