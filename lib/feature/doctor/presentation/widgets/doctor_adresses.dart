import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DoctorAdress extends StatelessWidget {
   DoctorAdress({ this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Text(text!,style: CustomTextStyles.lohit400style18.copyWith(color: AppColors.black1));
  }
}