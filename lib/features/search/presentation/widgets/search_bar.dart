import 'package:flutter/material.dart';

class ResultSearchBar extends StatelessWidget {
  const ResultSearchBar({required this.controller, super.key});

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      key: const Key('result_search_bar'),
      padding:
          const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24)),
      leading: const Icon(Icons.search),
      hintText: 'Search',
      elevation: const WidgetStatePropertyAll(0),
      focusNode: FocusNode(),
      textInputAction: TextInputAction.search,
      onTap: controller.openView,
    );
  }
}

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({required this.controller, super.key});

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        WidgetStatePropertyAll(Theme.of(context).textTheme.headlineSmall);
    return SearchBar(
      controller: controller,
      key: const Key('top_search_bar'),
      constraints: const BoxConstraints(minHeight: 90),
      padding:
          const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24)),
      textStyle: textStyle,
      hintText: 'Search',
      hintStyle: textStyle,
      elevation: const WidgetStatePropertyAll(0),
      focusNode: FocusNode(),
      textInputAction: TextInputAction.search,
      onTap: controller.openView,
    );
  }
}
