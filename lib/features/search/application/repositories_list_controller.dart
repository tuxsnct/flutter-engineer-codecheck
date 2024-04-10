import 'package:github_viewer/features/common/infrastructure/models/repository_model.dart';
import 'package:github_viewer/features/common/infrastructure/models/result.dart';
import 'package:github_viewer/features/search/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repositories_list_controller.g.dart';

@riverpod
class RepositoriesListController extends _$RepositoriesListController {
  @override
  FutureOr<List<RepositoryModel>> build(String query) async {
    final response =
        await ref.watch(searchRepositoryProvider).searchRepositories(query);

    return switch (response) {
      Success(value: final value) => value.items,
      Failure(exception: final exception) => throw exception,
    };
  }
}
