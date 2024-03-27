import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini_app/core/core.dart';
import 'package:flutter_gemini_app/domain/domain.dart';

import 'cubits.dart';

class MultiCubitProvider extends StatelessWidget {
  final Widget child;
  const MultiCubitProvider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GeneratePromptCubit(
            getIt.get<GeminiRepository>(),
          ),
        ),
        BlocProvider(
          create: (_) => ChatMessagesCubit(),
        ),
        BlocProvider(
          create: (_) => ChatScrollCubit(),
        ),
      ],
      child: child,
    );
  }
}
