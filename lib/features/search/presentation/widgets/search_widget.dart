import 'package:flutter/material.dart';
import 'package:github_viewer/config/router.dart';
import 'package:nil/nil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    required this.controller,
    required this.builder,
    this.initialText,
    super.key,
  });

  final SearchController controller;
  final Widget Function(BuildContext context, SearchController controller)
      builder;
  final String? initialText;

  SuggestionsBuilder get suggestionsBuilder => (context, controller) => [
        if (controller.text.isNotEmpty)
          ListTile(
            key: const Key('search_suggestion'),
            title: Text(controller.text),
            leading: const Icon(Icons.search),
            onTap: () => _onSubmitted(context),
          )
        else
          nil,
      ];

  void _onClose() => controller.closeView(initialText ?? '');

  Future<void> _onSubmitted(BuildContext context) async {
    final submittedText = controller.text;
    if (controller.isAttached) controller.closeView(initialText ?? '');
    await SearchResultRoute(submittedText).push<SearchResultRoute>(context);
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
        onPressed: _onClose,
        icon: const Icon(Icons.arrow_back),
      ),
      viewTrailing: [
        IconButton(
          onPressed: controller.clear,
          icon: const Icon(Icons.close),
        ),
      ],
      viewOnSubmitted: (text) => _onSubmitted(context),
      isFullScreen: true,
    );
  }
}
