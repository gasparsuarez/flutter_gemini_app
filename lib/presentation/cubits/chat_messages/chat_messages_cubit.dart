import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini_app/domain/entities/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_messages_state.dart';
part 'chat_messages_cubit.freezed.dart';

class ChatMessagesCubit extends Cubit<ChatMessagesState> {
  ChatMessagesCubit() : super(const ChatMessagesState());

  /// Function for add messages to chat
  void addMessage(MessageEntity message) {
    /// Copy the actual list and add new message
    emit(
      state.copyWith(messages: [...state.messages, message]),
    );
  }

  /// Function for clear chat
  void clearChat() => emit(const ChatMessagesState());
}
