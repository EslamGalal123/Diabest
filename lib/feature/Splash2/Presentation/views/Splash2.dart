import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_bottom_navigation.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/profile_doctor.dart';
import 'package:diiabest/feature/language/presentation/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplachViewBody(),
    );
  }
}

class SplachViewBody extends StatelessWidget {
  const SplachViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>( 
      listener: (context, state) {

        if (state is UserFound) {

          if (state.role == AppStrings.doctor) {

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileDoctorView(),
              ),
              (route) => false,
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomBtnNavigation(),
              ),
              (route) => false,
            );
          }
        }
        if (state is UserNotFound) {
          Future.delayed(Duration(seconds: 4),(){
               Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ChangeLanguage(),
            ),
            (route) => false,
          );
          });

        }
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
          ),
        ),
        child: Center(
          child: Image.asset(Assets.imagesLogo),
        ),
      ),
    );
  }
}
// void delayedNavigate(context, path) {
//   Future.delayed(const Duration(seconds: 4), () {
//     // customReplacementNavigate(context,"/ChangeLanguage");
//   });
// }
   // Container(
          //    decoration: const BoxDecoration(
          //       image: DecorationImage(
          //     image: AssetImage(
          //       "Assets/Images/text.jpeg"
          //     ),
          //     fit: BoxFit.cover,
          //   )) ,
          //   child: Center(
          //     child: Column(
          //       children: [
          //         Text('Enjoy Your Life With DiaBest👋')
          //       ],
          //     ),
          //   ),
          // ),
          // Container(
          //         decoration: const BoxDecoration(
          //               gradient: LinearGradient(
          //             colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
          //           )),
          //         child: Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,

          //             children: [
          //             Text("Enjoy Your Life With     \n            DiaBest👋",style: CustomTextStyles.lohit700style32.copyWith(fontWeight: FontWeight.w600),) ,
          //             SizedBox(height: 10,),
          //             Text('The best comfortable assistant of all time',style: CustomTextStyles.lohit500style22,)
          //           ]),
          //         ),
          //       ),