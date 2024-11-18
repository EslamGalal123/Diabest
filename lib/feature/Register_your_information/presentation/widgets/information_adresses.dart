import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformationAdresses extends StatelessWidget {
 InformationAdresses({super.key,required this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
              text!,
              style: CustomTextStyles.lohit500style18,
              textAlign: TextAlign.left,
              maxLines: 2
            );
  }
}