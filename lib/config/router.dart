import 'package:flutter/cupertino.dart';
import 'package:github_viewer/features/common/presentation/screens/home_screen.dart';
import 'package:github_viewer/features/search/presentation/screens/search_result_screen.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: $appRoutes,
);

/*
 ホーム
 path: /
 */
@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute() : super();
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

/*
 検索結果
 path: /search?query=検索ワード
 */
@TypedGoRoute<SearchResultRoute>(path: SearchResultRoute.path)
class SearchResultRoute extends GoRouteData {
  const SearchResultRoute(this.query) : super();
  static const path = '/search';

  final String query;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SearchResultScreen(query: query);
}
