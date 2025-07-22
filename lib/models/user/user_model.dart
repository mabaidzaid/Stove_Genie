import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Helpers that turn “anything” into the type you expect:
String _stringFromAny(dynamic v) => v?.toString() ?? "";
double _doubleFromAny(dynamic v) {
  if (v is num) return v.toDouble();
  return double.tryParse(v.toString()) ?? 0.0;
}

int _intFromAny(dynamic v) {
  if (v is num) return v.toInt();
  return int.tryParse(v.toString()) ?? 0;
}

bool _boolFromAny(dynamic v) {
  if (v is bool) return v;
  return v?.toString().toLowerCase() == 'true';
}

List<String> _stringListFromAny(dynamic v) {
  if (v is List) return v.map((e) => e.toString()).toList();
  return <String>[];
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(fromJson: _stringFromAny) @Default("") String id,
    @JsonKey(fromJson: _stringFromAny) @Default("") String name,
    @JsonKey(fromJson: _stringFromAny) @Default("") String email,
    @JsonKey(fromJson: _stringFromAny) @Default("") String number,
    @JsonKey(fromJson: _stringFromAny) @Default("") String city,
    @JsonKey(fromJson: _stringFromAny) @Default("") String licenseId,
    @JsonKey(fromJson: _stringFromAny) @Default("") String service,
    @JsonKey(fromJson: _stringFromAny) @Default("") String image,
    @JsonKey(fromJson: _boolFromAny) @Default(false) bool notifications,
    @JsonKey(fromJson: _stringFromAny) @Default("") String pushToken,
    @JsonKey(fromJson: _stringFromAny) @Default("") String state,
    @JsonKey(fromJson: _boolFromAny) @Default(false) bool online,
    @JsonKey(fromJson: _stringFromAny) @Default("") String createdAt,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double price,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double experience,
    @JsonKey(fromJson: _intFromAny) @Default(0) int orderCompleted,
    @JsonKey(fromJson: _stringFromAny) @Default("") String bio,
    @JsonKey(fromJson: _doubleFromAny) @Default(0.0) double rating,
    @JsonKey(fromJson: _stringListFromAny)
    @Default(<String>[])
    List<String> skills,
    @JsonKey(fromJson: _intFromAny) @Default(0) int followers,
    @JsonKey(fromJson: _intFromAny) @Default(0) int following,
    @JsonKey(fromJson: _intFromAny) @Default(0) int uploadedRecipesCount,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
