import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_up.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmThePassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Create New Password",
          // Applocalizations.of(context)!.translatetext("Create New Password"),
          style:  CustomTextStyles.lohit500style18,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: ListView(
            children: [
              SizedBox(height: 20.h),
              ClipOval(
                child: SizedBox(
                  width: 0.4.sw,
                  height: 0.4.sh,
                  child: Image.asset(
                    Assets.imagesImageNewpassword1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomTextFormField(
                validation: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  else if (newpassword.text.length < 6){
                    return "password should be at least 6 letters";
                  }
                },
                labelText: "New Password",
                //  Applocalizations.of(context)!.translatetext("New Password"),
                mycontroller: newpassword,
              ),
              CustomTextFormField(
                validation: (value){
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  else if (confirmThePassword.text.length < 6){
                    return "password should be at least 6 letters";
                  }
                  else if (newpassword.text != confirmThePassword.text){
                    return "your password not matching";
                  }
                },
                labelText: "Confirm Password",
                //  Applocalizations.of(context)!.translatetext("Confirm Password"),
                mycontroller: confirmThePassword,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Handle checkbox state
                    },
                  ),
                   Text("Remember me",style: CustomTextStyles.lohit400style18,
                      // Applocalizations.of(context)!.translatetext("Remember me")
                      ),
                ],
              ),
              SizedBox(height: 40.h),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                      (route) => false,
                    );
                  }
                  if (state is ResetPasswordFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                      ),
                    );
                  }
                },
                child: CustomBtn(
                  text: "Continue"
                  // Applocalizations.of(context)!.translatetext("Continue")
                  ,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).resetPassword(
                        password: newpassword.text,
                        comfirmPassword: confirmThePassword.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
