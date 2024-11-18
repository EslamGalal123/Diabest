import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/profile_doctor.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/doctor_adresses.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/edit_profil_form.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/time_work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileDoctor extends StatelessWidget {
  const EditProfileDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.editprofile,
            style: CustomTextStyles.lohit500style20,
          ),
        ),
        body: const EditDoctorProfileBody(),
      ),
    );
  }
}

class EditDoctorProfileBody extends StatelessWidget {
  const EditDoctorProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController citystreetblocknumber = TextEditingController();
    TextEditingController phoneNumbe = TextEditingController();
    TextEditingController whatsApp = TextEditingController();
    TextEditingController facebook = TextEditingController();

    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // تصميمك الأساسي للشاشة
    );

    final double width = 1.sw;
    final double height = 1.sh;

    return Form(
      key: BlocProvider.of<DoctorCubit>(context).formKey,
      child: SafeArea(
        child: BlocListener<DoctorCubit, DoctorState>(
          listener: (context, state) {
            if (state is UpdateDoctorSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileDoctorView()));
            }
            if (state is UpdateDoctorFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: EditProfileDoctorForm()),
                SliverToBoxAdapter(
                  child: DoctorAdress(text: AppStrings.clinicaddress),
                ),
                SliverToBoxAdapter(
                  child: CustomTextFormField(
                    mycontroller: citystreetblocknumber,
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
                    mycontroller: phoneNumbe,
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
                    mycontroller: facebook,
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
                    mycontroller: whatsApp,
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
                    height: height * 0.01,
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
                    height: height * 0.05,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomBtn(
                    text: AppStrings.saveprofile,
                    onPressed: () {
                      BlocProvider.of<DoctorCubit>(context).updateDoctor(
                        clinicAddress: citystreetblocknumber.text,
                        phoneNumber: phoneNumbe.text,
                        whatsApp: whatsApp.text,
                        facebook: facebook.text,
                      );
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
