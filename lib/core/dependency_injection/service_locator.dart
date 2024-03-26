import 'package:flutter_gemini_app/domain/domain.dart';
import 'package:flutter_gemini_app/infraestructure/infraestructure.dart';
import 'package:get_it/get_it.dart';

/// Global Variable
final getIt = GetIt.instance;

///
/// Service locator for register dependencies
///
class ServiceLocator {
  ServiceLocator._();

  ///
  /// Setup all dependencies
  ///
  static void setup() {
    /// Gemini Configuration Service
    getIt.registerSingleton<GeminiService>(GeminiService());

    /// Datasources
    getIt.registerLazySingleton<GeminiDatasource>(
      () => GeminiDatasourceImpl(getIt.get<GeminiService>()),
    );

    /// Repositories
    getIt.registerLazySingleton<GeminiRepository>(
      () => GeminiRepositoryImpl(getIt.get<GeminiDatasource>()),
    );
  }
}
