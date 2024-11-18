import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordViews extends StatelessWidget {
  const ForgotPasswordViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.lohit500style18,
          // Applocalizations.of(context)!.translatetext("Forget Password"),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: CustomForgetPasswordForm(),
        ),
      ),
    );
  }
}
