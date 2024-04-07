import 'package:flutter/material.dart';
import 'package:github_viewer/config/router.dart';
import 'package:nil/nil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    required this.controller,
    required this.builder,
    super.key,
  });

  final SearchController controller;
  final Widget Function(BuildContext context, SearchController controller)
      builder;

  SuggestionsBuilder get suggestionsBuilder => (context, controller) => [
        if (controller.text.isNotEmpty)
          ListTile(
            title: Text(controller.text),
            leading: const Icon(Icons.search),
            onTap: () => _onSubmitted(controller.text, context),
          )
        else
          nil,
      ];

  void _onSubmitted(String text, BuildContext context) {
    controller.closeView(null);
    SearchResultRoute(text).push<SearchResultRoute>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: controller,
      builder: builder,
      suggestionsBuilder: suggestionsBuilder,
      textInputAction: TextInputAction.search,
      viewHintText: 'Search...',
      viewLeading: IconButton(
        onPressed: () => controller.closeView(null),
        icon: const Icon(Icons.arrow_back),
      ),
      viewTrailing: [
        IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.close),
        ),
      ],
      viewOnSubmitted: (text) => _onSubmitted(text, context),
      isFullScreen: true,
    );
  }
}
