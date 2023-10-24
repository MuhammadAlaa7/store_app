import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hint,
    required this.labelText,
    required this.onChanged,
    this.textInputType,
  });

  final String hint;
  final String labelText;
  final void Function(String) onChanged;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          label: Text(
            labelText,
          ),
        ),
      ),
    );
  }
}
