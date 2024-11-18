import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(AppStrings.changepassword,style:  CustomTextStyles.lohit500style20),
          elevation: 0,
        ),
        body: const ChangePasswordBody(),
      ),
    );
  }
}

class ChangePasswordBody extends StatelessWidget {
  const ChangePasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is RestPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Success'),
            ));
            Navigator.pop(context);
          }
          if (state is RestPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
            Navigator.pop(context);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormField(
              label: AppStrings.currentpassword,
              // Applocalizations.of(context)!.translatetext("currentpassword"),
              controller: currentPasswordController,
            ),
            CustomFormField(
              label: AppStrings.newpassword,
              // Applocalizations.of(context)!.translatetext("newpassword"),
              controller: newPasswordController,
            ),
            CustomFormField(
              label: AppStrings.confirmThePassword,
              //  Applocalizations.of(context)!.translatetext("confirmThePassword"),
              controller: confirmPasswordController,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
          backgroundColor:  AppColors.primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),),
                onPressed: () {
                  BlocProvider.of<ProfileCubit>(context).changePassword(
                    confirmNewPassword: confirmPasswordController.text,
                    newPassword: newPasswordController.text,
                    password: currentPasswordController.text,
                  );
                  
                  // Handle change password logic
                },
                child: Text(
                  AppStrings.changepassword,
                  // Applocalizations.of(context)!.translatetext("changepassword"),

                  style: CustomTextStyles.lohit500style18.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.controller,
  });
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: CustomTextStyles.lohit400style18,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
