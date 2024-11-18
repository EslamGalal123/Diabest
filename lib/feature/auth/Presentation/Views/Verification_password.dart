import 'dart:async';

import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/auth/Presentation/Views/new_password.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyVerificationPage extends StatefulWidget {
  const MyVerificationPage({Key? key});

  @override
  _MyVerificationPageState createState() => _MyVerificationPageState();
}

class _MyVerificationPageState extends State<MyVerificationPage> {
  String emailAddress = '********@gmail.com';
  String otpCode = '';
  int countdown = 120;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP Verification",
          style:  CustomTextStyles.lohit500style18,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Text(
              "OTP Code Verification",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text('Enter code sent to $emailAddress',style: CustomTextStyles.lohit300style16.copyWith(fontSize: 14.sp,color: AppColors.black1),),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 6; i++)
                  Container(
                    width: 40.w,
                    height: 40.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 16.sp),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      controller: TextEditingController(
                        text: i < otpCode.length ? otpCode[i] : '',
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.h),
            Text('Reset code in $countdown s',style: CustomTextStyles.lohit300style16.copyWith(fontSize: 14.sp,color: AppColors.black1),),
            SizedBox(height: 16.h),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is VerifyEmailSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateNewPassword()),
                    (route) => false,
                  );
                }
                if (state is VerifyEmailFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF246BFE),
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                ),
                onPressed: () {
                  if (otpCode.isNotEmpty) {
                    BlocProvider.of<AuthCubit>(context).verifyEmailCode(code: otpCode);
                  }
                },
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: buildNumericKeyboard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumericKeyboard() {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildKeyboardButton('1'),
            buildKeyboardButton('2'),
            buildKeyboardButton('3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildKeyboardButton('4'),
            buildKeyboardButton('5'),
            buildKeyboardButton('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildKeyboardButton('7'),
            buildKeyboardButton('8'),
            buildKeyboardButton('9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildEmptyButton(),
            buildKeyboardButton('0'),
            buildBackspaceButton(),
          ],
        ),
      ],
    );
  }

  Widget buildKeyboardButton(String value) {
    return GestureDetector(
      onTap: () {
        if (value.isNotEmpty) {
          _onKeyboardButtonPressed(value);
        }
      },
      child: Container(
        width: 60.w,
        height: 60.h,
        margin: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(fontSize: 24.sp),
          ),
        ),
      ),
    );
  }

  Widget buildBackspaceButton() {
    return GestureDetector(
      onTap: () {
        _onBackspacePressed();
      },
      child: Container(
        width: 60.w,
        height: 60.h,
        margin: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.yellow[700],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: Icon(
            Icons.backspace,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget buildEmptyButton() {
    return Container(
      width: 60.w,
      height: 60.h,
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }

  void _onKeyboardButtonPressed(String value) {
    if (otpCode.length < 6) {
      setState(() {
        otpCode += value;
      });
    }
  }

  void _onBackspacePressed() {
    if (otpCode.isNotEmpty) {
      setState(() {
        otpCode = otpCode.substring(0, otpCode.length - 1);
      });
    }
  }
}
