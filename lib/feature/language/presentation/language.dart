import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/On-Boarding/presentation/views/on-boarding-view.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ShowOnBoard) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInView(),
              ),
            );
          } else if (state is UnShowOnBoard) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OnBoardingView(),
              ),
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
            ),
          ),
          height: 1.sh,
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Choose The Language",
                style: CustomTextStyles.lohit500style20.copyWith(fontSize: 20.sp),
                // Applocalizations.of(context)!.translatetext("choose the language")
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).checkShowOnBoard();
                  // BlocProvider.of<ApplanguageBloc>(context).add(ArabicLanguageEvent());
                  // customNavigate(context, "/signIn");
                },
                child: Text(
                  "اللغة العربية ",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).checkShowOnBoard();
                  // BlocProvider.of<ApplanguageBloc>(context).add(EnglishLanguageEvent());
                  // customNavigate(context, '/OnBoarding');
                },
                child: Text(
                  "  English  ",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageBody extends StatelessWidget {
  const LanguageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
