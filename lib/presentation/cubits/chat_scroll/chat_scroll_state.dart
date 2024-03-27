part of 'chat_scroll_cubit.dart';

@freezed
class ChatScrollState with _$ChatScrollState {
  const factory ChatScrollState.initial() = _Initial;
  const factory ChatScrollState.scrolling() = _Scrolling;
}
