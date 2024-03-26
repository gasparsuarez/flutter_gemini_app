import 'package:flutter/material.dart';
import 'package:flutter_gemini_app/core/core.dart';

class ResponseContainer extends StatelessWidget {
  const ResponseContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
