

import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed,this.backgroundColor=AppColors.primary});
  final String text;
  final VoidCallback onPressed;
 final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primarycolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      child: Text(
        text,style:CustomTextStyles.lohit400style18.copyWith(color: Colors.white) ,
      ),
    );
  }
}
