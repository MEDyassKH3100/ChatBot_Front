import 'package:flutter/material.dart';
import 'package:front/components/text_field_container.dart';
import 'package:front/constants.dart';
import 'dart:math';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;
  TextEditingController _controller = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String generatePassword() {
    String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lower = 'abcdefghijklmnopqrstuvwxyz';
    String numbers = '1234567890';
    String symbols = '!@#\$%^&*()<>,./';
    String password = '';
    int passLength = 20;
    String seed = upper + lower + numbers + symbols;
    List<String> list = seed.split('').toList();
    Random rand = Random();
    for (int i = 0; i < passLength; i++) {
      int index = rand.nextInt(list.length);
      password += list[index];
    }
    return password;
  }

  void _generatePassword() {
    String newPassword = generatePassword();
    _controller.text = newPassword;
    widget.onChanged(newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Row(
        children: [
          Expanded(
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
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: kPrimaryColor,
                  ),
                  onPressed: _toggleVisibility,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.cached, color: kPrimaryColor),
            onPressed: _generatePassword,
          ),
        ],
      ),
    );
  }
}
