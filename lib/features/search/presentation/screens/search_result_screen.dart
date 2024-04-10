import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_viewer/config/router.dart';
import 'package:github_viewer/features/common/infrastructure/models/repository_model.dart';
import 'package:github_viewer/features/common/presentation/widgets/status_indicator.dart';
import 'package:github_viewer/features/search/application/repositories_list_controller.dart';
import 'package:github_viewer/features/search/presentation/widgets/repository_card.dart';
import 'package:github_viewer/features/search/presentation/widgets/search_bar.dart';
import 'package:github_viewer/features/search/presentation/widgets/search_widget.dart';

class SearchResultScreen extends ConsumerStatefulWidget {
  const SearchResultScreen({required this.query, super.key});

  final String query;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchResultScreenState();
}

class _SearchResultScreenState extends ConsumerState<SearchResultScreen> {
  late SearchController controller;

  @override
  void initState() {
    super.initState();
    controller = SearchController()..text = widget.query;
    ref.read(repositoriesListControllerProvider(widget.query));
  }

  @override
  Widget build(BuildContext context) {
    final repositories =
        ref.watch(repositoriesListControllerProvider(widget.query));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => const HomeRoute().go(context),
            child: const Text('Github Viewer'),
          ),
        ),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SearchWidget(
                controller: SearchController()..text = widget.query,
                builder: (context, controller) => Align(
                  alignment: Alignment.topCenter,
                  child: ResultSearchBar(controller: controller),
                ),
                initialText: widget.query,
              ),
            ),
            Expanded(
              child: repositories.when(
                skipLoadingOnRefresh: false,
                data: (repositories) {
                  if (repositories.isNotEmpty) {
                    return ListView.builder(
                      itemCount: repositories.length,
                      itemBuilder: (context, index) {
                        final repository = repositories[index];
                        return RepositoryCard(
                          repository: repository,
                          onTap: () => RepositoryDetailRoute($extra: repository)
                              .push<RepositoryModel>(context),
                        );
                      },
                    );
                  } else {
                    return const WarningIndicator(
                      message: 'No repositories found.',
                    );
                  }
                },
                loading: LoadingIndicator.new,
                error: (error, _) => ErrorIndicator(
                  error: error,
                  onRetry: () => ref.refresh(
                    repositoriesListControllerProvider(widget.query).future,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
