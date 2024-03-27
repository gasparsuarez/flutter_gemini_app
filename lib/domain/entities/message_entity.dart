enum FromWho {
  they,
  we,
}

class MessageEntity {
  final String message;
  final FromWho whoWrite;

  MessageEntity({
    required this.message,
    required this.whoWrite,
  });
}
