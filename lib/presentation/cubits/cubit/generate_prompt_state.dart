part of 'generate_prompt_cubit.dart';

@freezed
class GeneratePromptState with _$GeneratePromptState {
  const factory GeneratePromptState.initial() = _Initial;
  const factory GeneratePromptState.loading() = _Loading;
  const factory GeneratePromptState.loaded(String text) = _Loaded;
  const factory GeneratePromptState.error(String error) = _Error;
}
