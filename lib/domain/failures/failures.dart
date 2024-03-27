import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.explicitMessage() = _ExplicitMessage;
  const factory Failure.networkError() = _NetworkError;
}
