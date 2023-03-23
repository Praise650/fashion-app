import 'package:flutter/material.dart';

class GeneralInputField extends StatelessWidget {
  GeneralInputField({
    this.controller,
    this.validator,
    this.text,
    this.iconData,
  });

  final TextEditingController? controller;
  final String? text;
  final IconData? iconData;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        maxLines: 1,
        validator: validator ??
            (value) {
              if (value!.isEmpty) {
                return "Field cannot be empty";
              } else {
                return null;
              }
            },
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[50]!.withOpacity(0.4),
          prefixIcon: Icon(iconData),
          hintText: "$text",
          labelText: '$text',
        ),
      ),
    );
  }
}
