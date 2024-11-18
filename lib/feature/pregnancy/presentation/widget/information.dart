import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PregnancyInformation extends StatelessWidget {
  final String text;
  double width ;
   PregnancyInformation({Key? key, required this.text , required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.specific,
          width: 30.w, // Utilize screen util for width
        ),
        SizedBox(width: 10.w), // Utilize screen util for spacing
        SizedBox(

          width: width,
          child: Text(

            text,
            style: CustomTextStyles.lohit400style22.copyWith(
              fontSize: 17.sp,color: AppColors.black1 // Utilize screen util for font size
            ),
          ),
        ),
        SizedBox(height: 20.h), // Utilize screen util for height
      ],
    );
  }
}
