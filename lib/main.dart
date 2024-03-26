import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini_app/core/dependency_injection/service_locator.dart';

import 'presentation/app.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  ServiceLocator.setup();
  runApp(const MyApp());
}
