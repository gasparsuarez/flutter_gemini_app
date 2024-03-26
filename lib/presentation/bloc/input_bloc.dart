import 'package:flutter/material.dart';

class InputBloc {
  final TextEditingController _inputController = TextEditingController();

  TextEditingController get inputController => _inputController;

  String get inputText => _inputController.text;
}
