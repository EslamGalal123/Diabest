// import 'package:diiabest/feature/On-Boarding/Functions/on_boarding.dart';
// import 'package:diiabest/feature/On-Boarding/presentation/views/widgets/custom_nav_bar.dart';
// import 'package:diiabest/feature/On-Boarding/presentation/views/widgets/get_buttons.dart';
// import 'package:diiabest/feature/On-Boarding/presentation/views/widgets/on_boarding_widget_body.dart';
// import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
// import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class OnBoardingView extends StatefulWidget {
//   const OnBoardingView({super.key});

//   @override
//   State<OnBoardingView> createState() => _OnBoardingViewState();
// }

// class _OnBoardingViewState extends State<OnBoardingView> {
//   final PageController _controller = PageController(initialPage: 0);
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;

//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: ListView(
//               physics: const BouncingScrollPhysics(),
//               children: [
//                 SizedBox(height: height * 0.04),
//                 CustomNavBar(
//                   onTap: () {
//                     onBoardingVisited();
//                     BlocProvider.of<AuthCubit>(context)
//                         .saveUserData(value: 'true', key: 'onBording');
//                     // customReplacementNavigate(context, "/signIn");
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SignInView()));
//                   },
//                 ),
//                 OnBoardingWidgetBody(
//                   onPageChanged: (index) {
//                     if (index == 2) {
//                       BlocProvider.of<AuthCubit>(context)
//                           .saveUserData(value: 'true', key: 'onBording');
//                     }
//                     setState(() {
//                       currentIndex = index;
//                     });
//                   },
//                   controller: _controller,
//                 ),
//                 SizedBox(height: height * 0.10),
//                 GetButtons(currentIndex: currentIndex, controller: _controller),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:diiabest/feature/On-Boarding/Functions/on_boarding.dart';
import 'package:diiabest/feature/On-Boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:diiabest/feature/On-Boarding/presentation/views/widgets/get_buttons.dart';
import 'package:diiabest/feature/On-Boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffa1c4fd), Color(0xffc2e9fb)],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 0.04.sh),
                    CustomNavBar(
                      onTap: () {
                        onBoardingVisited();
                        BlocProvider.of<AuthCubit>(context)
                            .saveUserData(value: 'true', key: 'onBording');
                        // customReplacementNavigate(context, "/signIn");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                        );
                      },
                    ),
                    OnBoardingWidgetBody(
                      onPageChanged: (index) {
                        if (index == 2) {
                          BlocProvider.of<AuthCubit>(context)
                              .saveUserData(value: 'true', key: 'onBording');
                        }
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      controller: _controller,
                    ),
                    SizedBox(height: 0.10.sh),
                    GetButtons(currentIndex: currentIndex, controller: _controller),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
