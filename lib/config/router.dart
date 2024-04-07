import 'package:flutter/cupertino.dart';
import 'package:github_viewer/features/common/presentation/screens/home_screen.dart';
import 'package:github_viewer/features/search/presentation/screens/search_result_screen.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

extension GoRouterLocation on GoRouter {
  String get location {
    final lastMatch = routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}

final routingConfig = RoutingConfig(routes: $appRoutes);
final router = GoRouter.routingConfig(
  routingConfig: ValueNotifier(routingConfig),
  initialLocation: const HomeRoute().location,
);

/*
 ホーム
 path: /
 */
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute() : super();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

/*
 検索結果
 path: /search?query=検索ワード
 */
@TypedGoRoute<SearchResultRoute>(path: '/search')
class SearchResultRoute extends GoRouteData {
  const SearchResultRoute(this.query) : super();

  final String query;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SearchResultScreen(query: query);
}
