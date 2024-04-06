import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_viewer/config/router.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    required this.controller,
    required this.builder,
    super.key,
  });

  final SearchController controller;
  final Widget Function(BuildContext context, SearchController controller)
      builder;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: controller,
      builder: builder,
      suggestionsBuilder: (context, controller) => [],
      textInputAction: TextInputAction.search,
      viewBuilder: (suggestions) => const SizedBox(),
      viewHintText: 'Search...',
      viewLeading: Row(
        children: <Widget>[
          IconButton(
            onPressed: () => controller.closeView(null),
            icon: const Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () {
              controller.closeView(null);
              if (ModalRoute.of(context)!.settings.name != HomeRoute.path) {
                const HomeRoute().go(context);
              }
            },
            icon: SvgPicture.asset(
              'assets/github-mark.svg',
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
      viewTrailing: [
        IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.close),
        ),
      ],
      viewOnSubmitted: (text) {
        controller.closeView(null);
        SearchResultRoute(text).push(context);
      },
      isFullScreen: true,
    );
  }
}
