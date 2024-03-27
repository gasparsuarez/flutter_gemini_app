part of 'chat_scroll_cubit.dart';

@freezed
sealed class ChatScrollState with _$ChatScrollState {
  const factory ChatScrollState.initial() = Initial;
  const factory ChatScrollState.scrolling() = Scrolling;
}
