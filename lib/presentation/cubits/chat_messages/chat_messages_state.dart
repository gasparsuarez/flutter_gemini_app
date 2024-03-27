part of 'chat_messages_cubit.dart';

@freezed
class ChatMessagesState with _$ChatMessagesState {
  const factory ChatMessagesState({
    @Default([]) List<MessageEntity> messages,
  }) = _ChatMessagesState;
}
