import 'package:flutter_gemini_app/domain/either/either.dart';
import 'package:flutter_gemini_app/domain/failures/failures.dart';

abstract class GeminiRepository {
  /// Generate prompt by user
  Future<Either<Failure, String>> generateResponse(String prompt);
}
