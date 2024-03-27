import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini_app/core/helpers.dart';
import 'package:flutter_gemini_app/domain/either/either.dart';
import 'package:flutter_gemini_app/domain/repositories/gemini_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_prompt_state.dart';
part 'generate_prompt_cubit.freezed.dart';

class GeneratePromptCubit extends Cubit<GeneratePromptState> {
  final GeminiRepository _repository;

  GeneratePromptCubit(this._repository) : super(const GeneratePromptState.initial());

  void sendPrompt(String prompt) async {
    /// Emit loading state
    emit(const GeneratePromptState.loading());

    /// Send user prompt to IA
    final results = await _repository.generateResponse(prompt);

    /// Filter result and emit new state
    switch (results) {
      case Right():
        emit(
          GeneratePromptState.loaded(results.right),
        );
      case Left():
        emit(
          GeneratePromptState.error(Helpers.parseFailureToString(results.left)),
        );
    }
  }
}
