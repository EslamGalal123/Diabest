import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_bottom_navigation.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_signin_form.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/profile_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
        if (state is SigninSuccessState) {
          if (state.currentUser.role == AppStrings.doctor) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileDoctorView(),
              ),
              (route) => false,
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CustomBtnNavigation()),
            );
          }
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: CustomSignInForm()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
