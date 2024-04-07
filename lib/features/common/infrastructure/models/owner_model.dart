import 'package:freezed_annotation/freezed_annotation.dart';

part 'owner_model.freezed.dart';
part 'owner_model.g.dart';

@freezed
class OwnerModel with _$OwnerModel {
  const factory OwnerModel({
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _OwnerModel;

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);
}
