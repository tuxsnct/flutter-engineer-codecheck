import 'package:flutter/material.dart';
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
              builder: (context, controller) {
                return FilledButton.tonal(
                  key: const Key('search_button'),
                  onPressed: () => controller.openView(),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(90),
                  ),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Search',
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Icon(Icons.search, size: 32),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
