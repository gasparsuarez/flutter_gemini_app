import 'package:flutter_dotenv/flutter_dotenv.dart';

///
/// Enviroment Variables Adapter
///
class EnvAdapter {
  final String _geminiKey = dotenv.env['GEMINI_KEY']!;

  String get geminiKey => _geminiKey;
}
