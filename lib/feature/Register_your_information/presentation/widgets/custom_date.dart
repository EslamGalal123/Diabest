import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateButton extends StatefulWidget {
  const DateButton({Key? key});

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  late DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    ))!;
    if (picked != _selectedDate) {
      var age = DateTime.now().year - picked.year;
      BlocProvider.of<RegisterPatientCubit>(context).age = age.toString();
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         "Birth Date",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.bold,
            color: AppColors.black1,
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Container(
          width: ScreenUtil().setWidth(140),
          height: ScreenUtil().setHeight(50),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(8)),
          ),
          child: ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.black1, backgroundColor: Colors.white,
            ),
            child: Text(
              ' ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(17),
                color: AppColors.black1,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
      ],
    );
  }
}
