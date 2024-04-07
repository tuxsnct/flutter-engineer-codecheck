import 'package:flutter/material.dart';
import 'package:github_viewer/config/router.dart';
import 'package:go_router/go_router.dart';

// coverage:ignore-start
void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const GithubViewerApp());
}
// coverage:ignore-end

class GithubViewerApp extends StatelessWidget {
  const GithubViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
