import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_viewer/bootstrap.dart';
import 'package:github_viewer/config/router.dart';
import 'package:github_viewer/config/theme.dart';
import 'package:go_router/go_router.dart';

// coverage:ignore-start
void main() async {
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(),
      child: GithubViewerApp(router: router),
    ),
  );
}
// coverage:ignore-end

class GithubViewerApp extends StatelessWidget {
  const GithubViewerApp({required this.router, super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp.router(
          title: 'Github Viewer',
          theme: lightTheme(lightDynamic),
          darkTheme: darkTheme(darkDynamic),
          routerConfig: router,
        );
      },
    );
  }
}
