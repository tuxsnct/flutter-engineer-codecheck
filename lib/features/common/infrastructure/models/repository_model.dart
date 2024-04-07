import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_viewer/features/common/infrastructure/models/owner_model.dart';

part 'repository_model.freezed.dart';
part 'repository_model.g.dart';

@freezed
class RepositoryModel with _$RepositoryModel {
  const factory RepositoryModel({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required OwnerModel owner,
    required String language,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
  }) = _RepositoryModel;

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);
}
