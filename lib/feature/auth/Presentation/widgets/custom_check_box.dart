
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: value,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
            side: BorderSide(
              color: AppColors.grey,
            ),
            onChanged: (newValue) {
              setState(() {
                value = newValue;
               
              });
            }
            ),
            Text(AppStrings.rememberme,style: CustomTextStyles.lohit400style18,),
            
      ],
    );
  }
}