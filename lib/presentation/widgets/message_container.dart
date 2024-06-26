import 'package:flutter/material.dart';
import 'package:flutter_gemini_app/core/core.dart';
import 'package:flutter_gemini_app/domain/domain.dart';
import 'package:flutter_gemini_app/presentation/widgets/gemini_avatar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';

class MessageContainer extends StatelessWidget {
  final MessageEntity message;
  const MessageContainer({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    const double radius = 12;
    bool weWrite = message.whoWrite == FromWho.we;

    ///
    /// Message bubble border radius
    ///
    final borderRadius = weWrite
        ? const BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          );

    final messageColor =
        weWrite ? Colors.lightBlueAccent.shade100 : Colors.lightBlueAccent.shade200;
    return Row(
      mainAxisAlignment: weWrite ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Condition for show AI Image
        if (!weWrite) const GeminiAvatar(),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(
              left: context.width * .02,
              top: context.height * .02,
              bottom: context.height * .02,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.width * .02,
              vertical: context.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: messageColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(
                    0,
                    4,
                  ),
                  blurRadius: 1,
                )
              ],
              borderRadius: borderRadius,
            ),
            child: Column(
              crossAxisAlignment: weWrite ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                MarkdownBody(
                  selectable: true,
                  data: message.message,
                ),
                Text(
                  _formatDate(
                    message.createdAt,
                  ),
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///
  /// Format date to hour:minutes [PM/AM]
  ///
  String _formatDate(DateTime dateTime) {
    return DateFormat('h:mm a').format(dateTime);
  }
}
