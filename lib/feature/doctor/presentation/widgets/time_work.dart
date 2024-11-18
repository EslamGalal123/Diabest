import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeWork extends StatefulWidget {
  const TimeWork({
    super.key,
    required this.date,
    required this.isStartTime,
  });
  final String date;
  final bool isStartTime;

  @override
  State<TimeWork> createState() => _TimeWorkState();
}

class _TimeWorkState extends State<TimeWork> {
  String? selectedStartTime;
  String? selectedEndTime;

  List<String> times = [
    '8:00 AM',
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
    '8:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.date,
            style: CustomTextStyles.lohit400style20.copyWith(
              color: AppColors.black1,
              fontSize: 20.sp, // Using ScreenUtil for font size
            ),
          ),
          DropdownButton<String>(
            value: selectedStartTime,
            hint: Text(
              "Time",
              style: TextStyle(fontSize: 18.sp), // Using ScreenUtil for font size
            ),
            // Applocalizations.of(context)!.translatetext(" Time")
            onChanged: (String? newValue) {
              widget.isStartTime == false
                  ? BlocProvider.of<DoctorCubit>(context).startTime = newValue!
                  : BlocProvider.of<DoctorCubit>(context).endTime = newValue!;
              setState(() {
                selectedStartTime = newValue;
              });
            },
            items: times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 18.sp), // Using ScreenUtil for font size
                ),
              );
            }).toList(),
            style: TextStyle(color: AppColors.black2, fontSize: 20.sp),
            underline: Container(
              height: 1.h, // Using ScreenUtil for height
              color: AppColors.black2,
            ),
          ),
        ],
      ),
    );
  }
}
