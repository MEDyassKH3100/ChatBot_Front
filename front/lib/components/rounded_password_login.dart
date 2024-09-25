import 'package:flutter/material.dart';

import 'package:front/components/text_field_container.dart';
import 'package:front/constants.dart';


class RoundedPasswordLogin extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  const RoundedPasswordLogin({
    super.key,
    required this.onChanged,
    required this.hintText, required bool isPasswordField,
  });

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordLogin> {
  bool _obscureText = true;
  final TextEditingController _controller = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
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
          icon: const Icon(
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
              
            ],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
