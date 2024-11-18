import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
class AddReminderComponent extends StatelessWidget {
  const AddReminderComponent({
    super.key,
    required this.tilte,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.validator,
  });
  final String tilte;
  final String hintText;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final bool readOnly;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tilte,
          style: CustomTextStyles.lohit500style22,
        ),
      const  SizedBox(height: 8),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            //hint
            hintText: hintText,
            hintStyle: CustomTextStyles.lohit400style20,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
