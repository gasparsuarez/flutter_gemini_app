import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
abstract class Either<L, R> with _$Either<L, R> {
  factory Either.left(L left) = Left;
  factory Either.right(R right) = Right;
}
