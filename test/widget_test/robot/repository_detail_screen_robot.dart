import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';
import 'package:go_router/go_router.dart';

import '../../abstract/screen_robot.dart';
import '../../values/github_api.dart';

class RepositoryDetailScreenRobot with ScreenSetupRobot implements ScreenRobot {
  RepositoryDetailScreenRobot({required this.tester, this.container});

  @override
  final WidgetTester tester;

  @override
  final initialLocation =
      RepositoryDetailRoute($extra: searchRepositoriesModel.items[0]).location;

  @override
  late GoRouter router;

  late final ProviderContainer? container;

  @override
  late final widget = UncontrolledProviderScope(
    container: container ?? ProviderContainer(),
    child: MaterialApp.router(routerConfig: router),
  );
}
