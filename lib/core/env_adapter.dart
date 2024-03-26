import 'package:flutter_dotenv/flutter_dotenv.dart';

///
/// Enviroment Variables Adapter
///
class EnvAdapter {
  EnvAdapter._();
  static final String _geminiKey = dotenv.env['GEMINI_KEY']!;

  static String get geminiKey => _geminiKey;
}
