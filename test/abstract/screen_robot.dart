import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_viewer/config/router.dart';
import 'package:go_router/go_router.dart';

abstract class ScreenRobot {
  WidgetTester get tester => throw UnimplementedError();

  String get initialLocation => throw UnimplementedError();

  Widget get widget => throw UnimplementedError();

  GoRouter get router => throw UnimplementedError();
}

mixin ScreenSetupRobot implements ScreenRobot {
  set router(GoRouter initialRouter) => router = initialRouter;

  Future<void> setup() async {
    router = GoRouter.routingConfig(
      routingConfig: ValueNotifier(RoutingConfig(routes: $appRoutes)),
      initialLocation: initialLocation,
    );
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
  }
}

mixin StatefulScreenRobot<W extends StatefulWidget, S extends State<W>>
    implements ScreenRobot {
  Future<S> get state async {
    return tester.state(find.byType(W));
  }
}
