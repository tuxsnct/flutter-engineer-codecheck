import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_viewer/features/common/infrastructure/models/repository_model.dart';

part 'search_repositories_model.freezed.dart';
part 'search_repositories_model.g.dart';

@freezed
class SearchRepositoriesResponseModel with _$SearchRepositoriesResponseModel {
  const factory SearchRepositoriesResponseModel({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'incomplete_results') required bool incompleteResults,
    required List<RepositoryModel> items,
  }) = _SearchRepositoriesResponseModel;

  factory SearchRepositoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRepositoriesResponseModelFromJson(json);
}
