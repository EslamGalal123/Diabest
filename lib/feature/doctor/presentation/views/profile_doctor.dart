import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/profile_doctor_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDoctorView extends StatelessWidget {
  const ProfileDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
    );

    final double height = 1.sh;

    return BlocProvider(
      create: (context) => DoctorCubit()..getDoctorData(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          centerTitle: true,
          actions: const [
            SingOutButton(),
          ],
          title: Text(
            AppStrings.doctor,
            style: CustomTextStyles.lohit500style20,
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: ListView(children: [
              SizedBox(
                height: height * 0.02,
              ),
              BlocListener<DoctorCubit, DoctorState>(
                listener: (context, state) {
                  if (state is SignOut) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: const ProfileDoctorForm(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SingOutButton extends StatelessWidget {
  const SingOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: const Icon(Icons.logout),
      onPressed: () {
        BlocProvider.of<DoctorCubit>(context).signOut();
      },
    );
  }
}