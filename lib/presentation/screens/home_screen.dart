import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini_app/core/core.dart';
import 'package:flutter_gemini_app/domain/domain.dart';
import 'package:flutter_gemini_app/presentation/bloc/input_bloc.dart';
import 'package:flutter_gemini_app/presentation/cubits/cubits.dart';
import 'package:flutter_gemini_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBloc = InputBloc();

    return MultiCubitProvider(
      child: BlocConsumer<GeneratePromptCubit, GeneratePromptState>(
        listener: (context, state) {
          switch (state) {
            case Loaded():

              ///
              /// If prompt is success, add Gemini response to chatview and execute scroll
              ///
              context.read<ChatMessagesCubit>().addMessage(MessageEntity(
                    message: state.text,
                    whoWrite: FromWho.they,
                  ));
              context.read<ChatScrollCubit>().scrollChat();
              break;
            case Error():

              /// Show bubble with failure message
              context.read<ChatMessagesCubit>().addMessage(MessageEntity(
                    message: state.failure,
                    whoWrite: FromWho.they,
                  ));
              break;
            case _:
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              toolbarHeight: context.height * 0.1,
              centerTitle: false,
              flexibleSpace: SafeArea(
                child: FlexibleSpaceBar(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.02),
                        child: Row(
                          children: [
                            const Text('Google Gemini AI'),
                            SizedBox(
                              width: context.width * 0.04,
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () => context.read<ChatMessagesCubit>().clearChat(),
                              child: const Text(
                                'CLEAR',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<GeneratePromptCubit, GeneratePromptState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () => Padding(
                              padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                              child: const Text(
                                'Gemini is typing...',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            orElse: () => const SizedBox.shrink(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              leadingWidth: context.width * 0.08,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ChatView(),
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
                              onPressed: () {
                                if (inputBloc.inputController.text.isEmpty) return;

                                /// Add my message to chat view
                                context.read<ChatMessagesCubit>().addMessage(
                                      MessageEntity(
                                        message: inputBloc.inputText,
                                        whoWrite: FromWho.we,
                                      ),
                                    );

                                /// Send prompt to IA
                                context.read<GeneratePromptCubit>().sendPrompt(inputBloc.inputText);

                                /// Scroll chat
                                context.read<ChatScrollCubit>().scrollChat();

                                /// Clear Textfield
                                inputBloc.inputController.clear();
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
