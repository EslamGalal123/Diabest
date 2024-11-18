import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_bottom_navigation.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:diiabest/feature/Register_your_information/presentation/widgets/custom_date.dart';
import 'package:diiabest/feature/Register_your_information/presentation/widgets/custom_form_info_page1.dart';
import 'package:diiabest/feature/Register_your_information/presentation/widgets/custom_height-weight.dart';
import 'package:diiabest/feature/Register_your_information/presentation/widgets/custom_marital_status.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class RegisterPatientInformation extends StatelessWidget {
//   const RegisterPatientInformation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RegisterPatientCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             AppStrings.registerYourInformation,
//             // Applocalizations.of(context)!.translatetext("registerYourInformation"),
//             style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: "poppins",
//                 color: AppColors.black2),
//           ),
//           elevation: 0,
//           backgroundColor: AppColors.offwhite,
//         ),
//         body: const RegisterPationBody(),
//       ),
//     );
//   }
// }

// class RegisterPationBody extends StatelessWidget {
//   const RegisterPationBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<RegisterPatientCubit, RegisterPatientState>(
//       listener: (context, state) {
//         if (state is RegisterPatientSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content: Text('تم التسجيل بنجاح'),
//           ));
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const CustomBtnNavigation()),
//           );
//         } else if (state is RegisterPatientFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(state.errorMessage),
//           ));
//         }
//       },
//       child: Form(
//         key: BlocProvider.of<RegisterPatientCubit>(context).formKey,
//         child: SafeArea(
//           child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: CustomScrollView(
//                   physics: const BouncingScrollPhysics(),
//                   slivers: [
//                     const SliverToBoxAdapter(child: SizedBox(height: 20)),
//                     const SliverToBoxAdapter(child: CustomHeightWeight()),
//                     const SliverToBoxAdapter(child: SizedBox(height: 10)),
//                     const SliverToBoxAdapter(
//                         child: Row(
//                       children: [
//                         Expanded(child: DateButton()),
//                         Expanded(child: CustomMaritalState())
//                       ],
//                     )),
//                     const SliverToBoxAdapter(child: SizedBox(height: 10)),
//                     const SliverToBoxAdapter(child: CustomFormInfoPage1()),
//                     const SliverToBoxAdapter(child: SizedBox(height: 25)),
//                     SliverToBoxAdapter(
//                         child: CustomBtn(
//                       text: AppStrings.next,
//                       // Applocalizations.of(context)!.translatetext("next"),
//                       onPressed: () {
//                         var formKey =
//                             BlocProvider.of<RegisterPatientCubit>(context)
//                                 .formKey;
//                         if (formKey.currentState!.validate()) {
//                           BlocProvider.of<RegisterPatientCubit>(context)
//                               .registerPatient(
//                             gender: BlocProvider.of<AuthCubit>(context)
//                                 .currentUser
//                                 .gender,
//                           );
//                         }
//                       },
//                     )),
//                     const SliverToBoxAdapter(child: SizedBox(height: 10)),
//                   ])),
//         ),
//       ),
//     );
//   }
// }


class RegisterPatientInformation extends StatelessWidget {
  const RegisterPatientInformation({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterPatientCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.registerYourInformation,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(24),
              fontWeight: FontWeight.w400,
              fontFamily: "poppins",
              color: AppColors.black2,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.offwhite,
        ),
        body: const RegisterPationBody(),
      ),
    );
  }
}

class RegisterPationBody extends StatelessWidget {
  const RegisterPationBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterPatientCubit, RegisterPatientState>(
      listener: (context, state) {
        if (state is RegisterPatientSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('تم التسجيل بنجاح'),
          ));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CustomBtnNavigation()),
          );
        } else if (state is RegisterPatientFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
      },
      child: Form(
        key: BlocProvider.of<RegisterPatientCubit>(context).formKey,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16)),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: ScreenUtil().setHeight(20))),
                SliverToBoxAdapter(child: CustomHeightWeight()),
                SliverToBoxAdapter(child: SizedBox(height: ScreenUtil().setHeight(10))),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(child: DateButton()),
                      Expanded(child: CustomMaritalState()),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: ScreenUtil().setHeight(10))),
                SliverToBoxAdapter(child: CustomFormInfoPage1()),
                SliverToBoxAdapter(child: SizedBox(height: ScreenUtil().setHeight(25))),
                SliverToBoxAdapter(
                  child: CustomBtn(
                    text: AppStrings.next,
                    onPressed: () {
                      var formKey = BlocProvider.of<RegisterPatientCubit>(context).formKey;
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterPatientCubit>(context).registerPatient(
                          gender: BlocProvider.of<AuthCubit>(context).currentUser.gender,
                        );
                      }
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: ScreenUtil().setHeight(10))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
