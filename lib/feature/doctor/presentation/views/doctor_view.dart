import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/profile_doctor.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/checked_container.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/doctor_adresses.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/time_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: const Scaffold(
        body: DoctorViewBody(),
      ),
    );
  }
}

class DoctorViewBody extends StatelessWidget {
  const DoctorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // تصميمك الأساسي للشاشة
    );

    final double width = 1.sw;
    final double height = 1.sh;

    return Form(
      key: BlocProvider.of<DoctorCubit>(context).formKey,
      child: BlocListener<DoctorCubit, DoctorState>(
        listener: (context, state) {
          if (state is RegisterDoctorSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileDoctorView(),
              ),
              (route) => false,
            );
          } else if (state is RegisterDoctorFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          } else if (state is GetProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errorMessage),
            ));
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.04,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    AppStrings.registernow,
                    style: CustomTextStyles.lohit500style24.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.black2,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.02,
                  ),
                ),
                SliverToBoxAdapter(
                  child: DoctorAdress(
                    text: AppStrings.specialization,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.01,
                  ),
                ),
                const SliverToBoxAdapter(child: CheckedContainer()),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.01,
                  ),
                ),
                SliverToBoxAdapter(
                  child: DoctorAdress(
                    text: AppStrings.clinicaddress,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.01,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    mycontroller: BlocProvider.of<DoctorCubit>(context)
                        .citystreetblocknumber,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      final RegExp regExp = RegExp(r'^[^/]+/[^/]+/[^/]+$');
                      if (!regExp.hasMatch(value)) {
                        return 'your address format not correct ';
                      }
                    },
                    labelText: AppStrings.citystreetblocknumber,
                    prefixIcon: const Icon(Icons.location_city_rounded),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    mycontroller:
                        BlocProvider.of<DoctorCubit>(context).phoneNumbe,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      else if (value.length != 11){
                        return "your phone number not correct";
                      }
                    },
                    labelText: AppStrings.phoneNumbe,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    mycontroller:
                        BlocProvider.of<DoctorCubit>(context).facebook,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                    },
                    labelText: "Link Of Facebook",
                    prefixIcon: const Icon(Icons.facebook),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    mycontroller:
                        BlocProvider.of<DoctorCubit>(context).whatsApp,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                    },
                    labelText: "Link Of WhatsApp",
                    prefixIcon: const Icon(Icons.chat),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.02,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const Icon(Icons.punch_clock),
                      DoctorAdress(
                        text: AppStrings.timework,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.01,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      const TimeWork(
                        date: AppStrings.start,
                        isStartTime: true,
                      ),
                      SizedBox(
                        width: width * 0.2,
                      ),
                      const TimeWork(
                        date: AppStrings.end,
                        isStartTime: false,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * 0.06,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomBtn(
                    text: AppStrings.saveprofile,
                    onPressed: () {
                      var formKey =
                          BlocProvider.of<DoctorCubit>(context).formKey;
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<DoctorCubit>(context).registerDoctor();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
