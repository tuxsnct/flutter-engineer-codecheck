import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            FilledButton.tonal(
              key: const Key('search_button'),
              onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
