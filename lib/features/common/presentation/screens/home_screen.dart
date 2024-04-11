import 'package:flutter/material.dart';
import 'package:github_viewer/features/search/presentation/widgets/search_bar.dart';
import 'package:github_viewer/features/search/presentation/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

@visibleForTesting
class HomeScreenState extends State<HomeScreen> {
  late SearchController controller;

  @override
  void initState() {
    super.initState();
    controller = SearchController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'GitHub Viewer',
              key: const Key('title'),
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 32),
            SearchWidget(
              controller: controller,
              builder: (context, controller) =>
                  TopSearchBar(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
