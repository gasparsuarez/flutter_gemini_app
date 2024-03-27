import 'package:flutter_gemini_app/core/env_adapter.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

///
/// Gemini API configuration
///
class GeminiService {
  ///
  /// Gemini Model Type
  ///
  static const String _modelType = 'gemini-pro';

  ///
  /// Gemini API Key
  ///
  static String apiKey = EnvAdapter.geminiKey;

  ///
  /// Create Model
  ///
  static final GenerativeModel _model = GenerativeModel(
    model: _modelType,
    apiKey: apiKey,
  );

  /// Getters
  GenerativeModel get model => _model;
}
