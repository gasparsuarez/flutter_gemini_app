import 'package:dartz/dartz.dart';
import 'package:flutter_gemini_app/domain/failures/failures.dart';

abstract class GeminiRepository {
  Future<Either<Failure, String>> generateResponse(String prompt);
}
