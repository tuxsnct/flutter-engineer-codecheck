import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_colour/github_colour.dart';
import 'package:go_router/go_router.dart';

Future<ProviderContainer> bootstrap() async {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  WidgetsFlutterBinding.ensureInitialized();
  await GitHubColour.initialize();

  final container = ProviderContainer();

  return container;
}
