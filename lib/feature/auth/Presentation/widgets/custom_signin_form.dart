import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_up.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_check_box.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_social_icons.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/forgot_password_text_widget.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/have_an_account_widget.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInForm extends StatefulWidget {
  CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  TextEditingController emailAddress = TextEditingController();

  TextEditingController password = TextEditingController();

bool isPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: 0.4.sh,
          ),
          Text(
            AppStrings.logintoyouraccount,
            // Applocalizations.of(context)!.translatetext("logintoyouraccount"),
            style: CustomTextStyles.lohit500style24,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextFormField(
            validation: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (!value.contains('@') ||
                  !value.contains('.') ||
                  !value.contains('gmail')) {
                return 'your email not correct';
              }
              return null;
            },
            mycontroller: emailAddress,
            labelText: AppStrings.emailAddress,
            // Applocalizations.of(context)!.translatetext("emailAddress"),
            prefixIcon: const Icon(Icons.email),
            onChanged: (email) {},
          ),
          CustomTextFormField(
            validation: (value){
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              else if (password.text.length < 6){
                return "your password not correct!";
              }
            },
            mycontroller: password,
            labelText: AppStrings.password,
            obscureText: isPasswordObscure,
            // Applocalizations.of(context)!.translatetext("password"),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: (isPasswordObscure == true)?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
              onPressed: () {
                setState(() {
                  isPasswordObscure =! isPasswordObscure;
                });
              },),
            onChanged: (password) {},
          ),
          const CustomCheckBox(),
          SizedBox(
            height: 10.h,
          ),
          CustomBtn(
            text: AppStrings.signIn,
            // Applocalizations.of(context)!.translatetext("signIn"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).loginWithEmailAndPassword(
                  email: emailAddress.text,
                  password: password.text,
                );
              }
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          const ForgotPasswordTextWidget(),
          SizedBox(
            height: 20.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSocialIcons(
                image: Assets.imagesImageFacebook,
                url: '',
              ),
              CustomSocialIcons(
                image: Assets.imagesImageGoogle,
                url: '',
              ),
              CustomSocialIcons(
                image: Assets.imagesImageApple,
                url: '',
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          HaveAnAccountWidget(
            text1: AppStrings.donthaveanaccount,
            // Applocalizations.of(context)!.translatetext("donthaveanaccount"),
            text2: AppStrings.signUp,
            //  Applocalizations.of(context)!.translatetext("signUp"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpView()),
              );
              //  customNavigate(context, "/signUp");
            },
          )
        ],
      ),
    );
  }
}
