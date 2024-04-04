import 'package:flutter/material.dart';
import 'package:github_viewer/config/router.dart';

void main() {
  runApp(const GithubViewerApp());
}

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
