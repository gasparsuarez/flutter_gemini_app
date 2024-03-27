part of 'generate_prompt_cubit.dart';

@freezed
sealed class GeneratePromptState with _$GeneratePromptState {
  const factory GeneratePromptState.initial() = _Initial;
  const factory GeneratePromptState.loading() = Loading;
  const factory GeneratePromptState.loaded(String text) = Loaded;
  const factory GeneratePromptState.error(String failure) = Error;
}
