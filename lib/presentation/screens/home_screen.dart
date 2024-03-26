import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini_app/core/core.dart';
import 'package:flutter_gemini_app/domain/repositories/gemini_repository.dart';
import 'package:flutter_gemini_app/presentation/bloc/input_bloc.dart';
import 'package:flutter_gemini_app/presentation/cubits/cubit/generate_prompt_cubit.dart';
import 'package:flutter_gemini_app/presentation/widgets/response_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBloc = InputBloc();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GeneratePromptCubit(
            getIt.get<GeminiRepository>(),
          ),
        ),
      ],
      child: BlocBuilder<GeneratePromptCubit, GeneratePromptState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              title: const Text('Google Gemini AI'),
            ),
            body: Column(
              children: [
                const ResponseContainer(),
                Container(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.04,
                      vertical: context.height * 0.02,
                    ),
                    child: SafeArea(
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                controller: inputBloc.inputController,
                                decoration: InputDecoration(
                                  hintText: 'Escribe una pregunta..',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: IconButton(
                              style: IconButton.styleFrom(),
                              onPressed: () {
                                if (inputBloc.inputController.text.isEmpty) return;

                                context
                                    .read<GeneratePromptCubit>()
                                    .generateResponse(inputBloc.inputText);
                              },
                              icon: const Icon(Icons.send),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
