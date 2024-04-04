import 'package:flutter/cupertino.dart';
import 'package:github_viewer/features/common/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: $appRoutes,
);

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute() : super();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const HomeScreen(title: 'Flutter Demo Home Page');
}
