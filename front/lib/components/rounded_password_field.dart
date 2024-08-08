import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front/components/text_field_container.dart';
import 'package:front/constants.dart';
import 'dart:math';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintText, required bool isPasswordField,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _controller.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Password copied to clipboard")),
    );
  }

  String generatePassword() {
    const String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lower = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '1234567890';
    const String symbols = '!@#\$%^&*()<>,./';
    String password = '';
    const int passLength = 20;
    final String seed = upper + lower + numbers + symbols;
    final List<String> list = seed.split('').toList();
    final Random rand = Random();
    for (int i = 0; i < passLength; i++) {
      final int index = rand.nextInt(list.length);
      password += list[index];
    }
    return password;
  }

  void _generatePassword() {
    final String newPassword = generatePassword();
    _controller.text = newPassword;
    widget.onChanged(newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: _controller,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                ),
                onPressed: _toggleVisibility,
              ),
              IconButton(
                icon: Icon(
                  Icons.copy,
                  color: kPrimaryColor,
                ),
                onPressed: _copyToClipboard,
              ),
              IconButton(
                icon: Icon(
                  Icons.cached,
                  color: kPrimaryColor,
                ),
                onPressed: _generatePassword,
              ),
            ],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
