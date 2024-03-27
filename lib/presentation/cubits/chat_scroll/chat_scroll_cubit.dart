import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_scroll_state.dart';
part 'chat_scroll_cubit.freezed.dart';

class ChatScrollCubit extends Cubit<ChatScrollState> {
  ChatScrollCubit() : super(const ChatScrollState.initial());

  void scrollChat() {
    emit(const ChatScrollState.initial());
    emit(const ChatScrollState.scrolling());
  }
}
