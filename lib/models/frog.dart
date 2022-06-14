import 'package:freezed_annotation/freezed_annotation.dart';

part 'frog.freezed.dart';
part 'frog.g.dart';

@freezed
class Frog with _$Frog {
  const factory Frog({
    int? id,
    @JsonKey(name: 'frog_name') String? frogName,
    @JsonKey(name: 'user_id') String? userId,
  }) = _Frog;

  factory Frog.fromJson(Map<String, Object?> json) => _$FrogFromJson(json);
}
