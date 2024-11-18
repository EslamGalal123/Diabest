import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/Register_your_information/presentation/widgets/custom_height-weight.dart';
import 'package:diiabest/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInfoForPatient extends StatefulWidget {
  const CustomInfoForPatient({super.key});

  @override
  State<CustomInfoForPatient> createState() => _CustomInfoForPatientState();
}

class _CustomInfoForPatientState extends State<CustomInfoForPatient> {
  String maritalStatus = 'Single';
  
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.weight,
                      style: CustomTextStyles.lohit500style20.copyWith(fontSize: 20.sp),
                    ),
                    ProfileFormFeild(
                      mycontroller: BlocProvider.of<ProfileCubit>(context).weight,
                      label: '',
                      hint: AppStrings.enteryour,
                      prefixIcon: Icons.fitness_center,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.height,
                      style: CustomTextStyles.lohit500style20.copyWith(fontSize: 20.sp),
                    ),
                    ProfileFormFeild(
                      mycontroller: BlocProvider.of<ProfileCubit>(context).height,
                      label: '',
                      hint: AppStrings.enteryour,
                      prefixIcon: Icons.height,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.maritalStatus,
                      style: CustomTextStyles.lohit500style20.copyWith(fontSize: 20.sp),
                    ),
                    DropdownButton<String>(
                      value: maritalStatus,
                      onChanged: (String? newValue) {
                        BlocProvider.of<ProfileCubit>(context).status = newValue!;
                        setState(() {
                          maritalStatus = newValue;
                        });
                      },
                      items: <String>[
                        AppStrings.single,
                        AppStrings.married,
                        AppStrings.divorced,
                        AppStrings.widowed,
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.sp),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
    );
  }
}
