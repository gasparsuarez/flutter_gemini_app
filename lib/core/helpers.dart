import 'package:flutter_gemini_app/domain/failures/failures.dart';

class Helpers {
  ///
  /// Parse possibles errors to string
  ///
  static String parseFailureToString(Failure failure) {
    return failure.when(
      explicitMessage: () => 'No puedes utilizar lenguaje inapropiado',
      networkError: () => 'Upps! Parece que hay un error de conexión',
    );
  }
}
