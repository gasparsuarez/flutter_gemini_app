import 'package:flutter/material.dart';
import 'package:flutter_gemini_app/core/core.dart';

class GeminiAvatar extends StatelessWidget {
  const GeminiAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.height * 0.04,
      height: context.height * 0.04,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              0,
              4,
            ),
            blurRadius: 1,
          )
        ],
      ),
      child: Image.asset(
        'assets/gemini_icon.png',
      ),
    );
  }
}
