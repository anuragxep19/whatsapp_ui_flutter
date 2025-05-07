import 'package:flutter/material.dart';

class OTPField extends StatefulWidget {
  const OTPField({super.key});

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  //  Create 6 focus nodes
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  // Create 6 controllers
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var ctrl in _controllers) {
      ctrl.dispose();
    }
    super.dispose();
  }

  /// Handles focus movement when user types or deletes a digit
  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus(); // move forward
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus(); // move backward
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      // Adds green underline border
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.green, width: 2)),
      ),

      // OTP input fields in a row
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return SizedBox(
            width: 20,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,

              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: '__',
                counterText: '',
                border: InputBorder.none,
              ),

              // Handle focus navigation when typing
              onChanged: (val) => _onChanged(val, index),
            ),
          );
        }),
      ),
    );
  }
}
