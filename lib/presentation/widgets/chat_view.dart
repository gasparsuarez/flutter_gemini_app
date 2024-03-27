import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini_app/core/core.dart';
import 'package:flutter_gemini_app/domain/entities/entities.dart';
import 'package:flutter_gemini_app/presentation/cubits/cubits.dart';
import 'package:flutter_gemini_app/presentation/widgets/widgets.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatScrollCubit, ChatScrollState>(
      listener: (context, state) {
        switch (state) {
          case Scrolling _:

            ///
            /// Move scroll when user or AI send new message
            ///
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            });
            break;
          case _:
        }
      },
      child: BlocBuilder<ChatMessagesCubit, ChatMessagesState>(
        builder: (context, state) {
          if (state.messages.isEmpty) {
            return const EmptyChat();
          }
          return Expanded(
            child: Container(
              width: context.width,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: state.messages.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) {
                    final message = state.messages[index];
                    return MessageContainer(
                      message: message.message,
                      weWrite: message.whoWrite == FromWho.we,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
