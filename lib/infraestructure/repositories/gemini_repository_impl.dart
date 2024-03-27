import 'dart:io';

import 'package:flutter_gemini_app/domain/datasources/gemini_datasource.dart';
import 'package:flutter_gemini_app/domain/either/either.dart';
import 'package:flutter_gemini_app/domain/failures/failures.dart';
import 'package:flutter_gemini_app/domain/repositories/gemini_repository.dart';

class GeminiRepositoryImpl implements GeminiRepository {
  final GeminiDatasource _datasource;

  /// Dependency Injection
  GeminiRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, String>> generateResponse(String prompt) async {
    try {
      final response = await _datasource.generateResponse(prompt);
      return Either.right(response.text!);
    } on SocketException catch (_) {
      return Either.left(const Failure.networkError());
    } catch (e) {
      return Either.left(const Failure.explicitMessage());
    }
  }
}
