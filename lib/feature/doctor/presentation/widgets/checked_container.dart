import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckedContainer extends StatefulWidget {
  const CheckedContainer({super.key});

  @override
  State<CheckedContainer> createState() => _CheckedContainerState();
}

class _CheckedContainerState extends State<CheckedContainer> {
  int selected = 0;

  Widget customRadio(String image, String title, int index) {
    return OutlinedButton(
      onPressed: () {
        BlocProvider.of<DoctorCubit>(context).seletSpecialization(index: index);
        setState(() {
          selected = index;
        });
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        backgroundColor: (selected == index) ? Colors.blue : Colors.white,
      ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20.w),
        width: 0.29.sw,
        height: 0.11.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 0.09.sw,
            ),
            Text(
              title,
              style: TextStyle(
                color: (selected == index) ? Colors.white : Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // تصميمك الأساسي للشاشة
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          customRadio(
            Assets.imagesImageInternist,
            AppStrings.internist,
            1,
          ),
          SizedBox(width: 5.w),
          customRadio(
            Assets.imagesImageCardiologist,
            AppStrings.cardiologist,
            2,
          ),
          SizedBox(width: 5.w),
          customRadio(
            Assets.imagesImageDermatolo,
            AppStrings.dermatology,
            3,
          ),
          SizedBox(width: 5.w),
          customRadio(
            Assets.imagesHepatologist,
            AppStrings.hepatologist,
            4,
          ),
          SizedBox(width: 5.w),
        ],
      ),
    );
  }
}
