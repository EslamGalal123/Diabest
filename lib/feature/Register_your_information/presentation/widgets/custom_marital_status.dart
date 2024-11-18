import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaritalState extends StatefulWidget {
  const CustomMaritalState({super.key});

  @override
  State<CustomMaritalState> createState() => _CustomMaritalStateState();
}

class _CustomMaritalStateState extends State<CustomMaritalState> {
  String maritalStatus = AppStrings.single;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.maritalStatus,
            style: CustomTextStyles.lohit500style18,
          ),
          SizedBox(height: 8.h), // Add spacing between elements
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: DropdownButton<String>(
              value: maritalStatus,
              isExpanded: true,
              underline: SizedBox(), // Remove underline
              onChanged: (String? newValue) {
                BlocProvider.of<RegisterPatientCubit>(context).status = newValue!;
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
                  child: Text(value, style: CustomTextStyles.lohit400style18),
                );
              }).toList(),
            ),
          ),
        ],
    );
  }
}
