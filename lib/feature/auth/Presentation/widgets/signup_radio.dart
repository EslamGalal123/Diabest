import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpRadio extends StatefulWidget {
  const SignUpRadio({Key? key}) : super(key: key);

  @override
  State<SignUpRadio> createState() => _SignUpRadioState();
}

class _SignUpRadioState extends State<SignUpRadio> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio<String>(
              value: AppStrings.patient,
              groupValue: selectedOption ,
              onChanged: (String? value) {
                BlocProvider.of<AuthCubit>(context).role = AppStrings.patient;
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            Text(
              AppStrings.patient,
              style:  CustomTextStyles.lohit400style18
            ),
            SizedBox(
              width: width * 0.13,
            ),
            Radio<String>(
              value: AppStrings.doctor,
              groupValue: selectedOption,
              onChanged: (String? value) {
                BlocProvider.of<AuthCubit>(context).role = AppStrings.doctor;
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
            Text(
              AppStrings.doctor,
              style: CustomTextStyles.lohit400style18
            ),
          ],
        ),
        SizedBox(height: height * 0.01),
        CustomBtn(
          text: AppStrings.signUp,
          onPressed: () {
            var formKey = BlocProvider.of<AuthCubit>(context).signupFormKey;
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context).signUpWithEmailAndPassword();
            }
          },
        ),
      ],
    );
  }
}
