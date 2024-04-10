import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_viewer/config/router.dart';
import 'package:go_router/go_router.dart';

// coverage:ignore-start
void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(ProviderScope(child: GithubViewerApp(router: router)));
}
// coverage:ignore-end

class GithubViewerApp extends StatelessWidget {
  const GithubViewerApp({required this.router, super.key});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Github Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
