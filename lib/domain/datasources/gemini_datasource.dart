import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GeminiDatasource {
  Future<GenerateContentResponse> generateResponse(String prompt);
}
