// import 'dart:io';

// import 'package:diiabest/core/Database/cache/cache_helper.dart';
// import 'package:diiabest/core/Database/cache/constants.dart';
// import 'package:diiabest/core/Utils/App-colors.dart';
// import 'package:diiabest/core/services/service_locator.dart';
// import 'package:diiabest/feature/On-Boarding/presentation/views/on-boarding-view.dart';
// import 'package:diiabest/feature/Splash2/Presentation/views/Splash2.dart';
// import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
// import 'package:diiabest/feature/my_watch/presentation/views/my_watch.dart';
// import 'package:diiabest/feature/reminder_medicins/presentation/widget/notification.dart';
// import 'package:diiabest/simple_observer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   sharedPreferences = await SharedPreferences.getInstance();
//   setupServiceLocator();
//   await getIt<CacheHelper>().init();
//   await Future.wait([
//     LocalNotificationService.init(),
//   ]);
//   Bloc.observer = SimpleBlocObServer();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double fontSize = MediaQuery.of(context).devicePixelRatio;
//     return BlocProvider(
//       create: (context) => AuthCubit()..checkIsLogin(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//             textTheme: TextTheme(
//               titleLarge: TextStyle(
//                   fontSize: fontSize * 12,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: "poppins",
//                   color: AppColors.primarycolor),
//               titleMedium: TextStyle(
//                   fontSize: fontSize * 9,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: "poppins",
//                   color: AppColors.black1),
//               titleSmall: TextStyle(
//                   fontSize: fontSize * 7,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: "poppins",
//                   color: AppColors.black1),
//               bodyMedium: TextStyle(
//                   fontSize: fontSize * 8,
//                   fontWeight: FontWeight.w500,
//                   fontFamily: "poppins",
//                   color: AppColors.black1),
//               bodySmall: TextStyle(
//                   fontSize: fontSize * 6.5,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: "poppins",
//                   color: AppColors.black2),
//             ),
//             scaffoldBackgroundColor: AppColors.offwhite),
//         home:  OnBoardingView(),
//       ),
//     );
//   }
// }
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
import 'dart:io';
import 'package:diiabest/core/Database/cache/cache_helper.dart';
import 'package:diiabest/core/Database/cache/constants.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_bottom_navigation.dart';
import 'package:diiabest/core/services/service_locator.dart';
import 'package:diiabest/feature/Home/presentatio/views/home_views.dart';
import 'package:diiabest/feature/On-Boarding/presentation/views/on-boarding-view.dart';
import 'package:diiabest/feature/On-Boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:diiabest/feature/Register_your_information/presentation/views/register_your_information.dart';
import 'package:diiabest/feature/Splash2/Presentation/views/Splash2.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/doctor_view.dart';
import 'package:diiabest/feature/doctor/presentation/views/profile_doctor.dart';
import 'package:diiabest/feature/language/presentation/language.dart';
import 'package:diiabest/feature/my_watch/presentation/views/my_watch.dart';
import 'package:diiabest/feature/organs/presentation/widget/eyes_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/heart_form.dart';
import 'package:diiabest/feature/organs/presentation/widget/heart_view.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/cubit/calender_cubit.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/cubit/time_cubit.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/view/reminder_medicin.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/widget/notification.dart';
import 'package:diiabest/simple_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/doctor/presentation/views/edit_profile.dart';
import 'feature/reminder_medicins/data/function/local_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
/*  await Future.wait([
    LocalNotificationService.init(),
  ]);*/
  Bloc.observer = SimpleBlocObServer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
              AuthCubit()
                ..checkIsLogin(),
            ),
            BlocProvider(
              create: (context) => CalenderCubit(),
            ),
            BlocProvider(
              create: (context) => TimeCubit(),
            ),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: TextTheme(
                  titleLarge: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                      color: AppColors.primarycolor),
                  titleMedium: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                      color: AppColors.black1),
                  titleSmall: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "poppins",
                      color: AppColors.black1),
                  bodyMedium: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "poppins",
                      color: AppColors.black1),
                  bodySmall: TextStyle(
                      fontSize: 6.5.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "poppins",
                      color: AppColors.black2),
                ),
                scaffoldBackgroundColor: AppColors.offwhite),
            home: SplashView(),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
