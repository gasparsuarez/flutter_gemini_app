import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini_app/domain/repositories/gemini_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_prompt_state.dart';
part 'generate_prompt_cubit.freezed.dart';

class GeneratePromptCubit extends Cubit<GeneratePromptState> {
  final GeminiRepository _repository;
  GeneratePromptCubit(this._repository) : super(const GeneratePromptState.initial());

  void generateResponse(String prompt) async {
    emit(const GeneratePromptState.loading());

    final response = await _repository.generateResponse(prompt);

    response.fold(
      (failure) => emit(const GeneratePromptState.error('Ocurrió un error')),
      (text) => emit(GeneratePromptState.loaded(text)),
    );
  }
}