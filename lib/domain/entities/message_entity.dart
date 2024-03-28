enum FromWho {
  they,
  we,
}

class MessageEntity {
  final String message;
  final FromWho whoWrite;
  final DateTime createdAt;

  MessageEntity({
    required this.createdAt,
    required this.message,
    required this.whoWrite,
  });
}
