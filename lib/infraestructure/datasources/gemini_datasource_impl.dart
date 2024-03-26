import 'package:flutter_gemini_app/domain/datasources/gemini_datasource.dart';
import 'package:flutter_gemini_app/infraestructure/gemini/gemini_service.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiDatasourceImpl implements GeminiDatasource {
  final GeminiService _api;

  /// Dependency Injection
  GeminiDatasourceImpl(this._api);

  @override
  Future<GenerateContentResponse> generateResponse(String prompt) async {
    final content = [
      Content.text(prompt),
    ];
    final response = await _api.model.generateContent(content);
    return response;
  }
}
