import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/auth/Presentation/Views/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ForgotPasswordViews(),
          ),
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.lohit500style14.copyWith(
            color: AppColors.deebGrey,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
