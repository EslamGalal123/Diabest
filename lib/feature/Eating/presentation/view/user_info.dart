import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Eating/presentation/widget/custom_meal_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  String _gender = 'Male';

  double? _bmi;
  int? _calories;
  String? _weightStatus;

  void _calculateBmiAndCalories() {
    final double height = double.parse(_heightController.text) / 100;
    final double weight = double.parse(_weightController.text);
    final int age = int.parse(_ageController.text);

    setState(() {
      _bmi = weight / (height * height);
      if (_gender == 'Male') {
        _calories = (10 * weight + 6.25 * height * 100 - 5 * age + 5).toInt();
      } else {
        _calories = (10 * weight + 6.25 * height * 100 - 5 * age - 161).toInt();
      }

      if (_bmi! < 18.5) {
        _weightStatus = 'Underweight';
      } else if (_bmi! < 24.9) {
        _weightStatus = 'Ideal';
      } else if (_bmi! < 29.9) {
        _weightStatus = 'Overweight';
      } else {
        _weightStatus = 'Obese';
      }
    });
  }

  void _goToMealSectionPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealSectionPage(calories: _calories),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'User Information',
              style: CustomTextStyles.lohit500style22.copyWith(fontSize: 22.sp),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Form(
              key: _formKey,
              child: ListView(children: [
                Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _gender,
                      decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle: CustomTextStyles.lohit500style22
                              .copyWith(fontSize: 22.sp)),
                      items: [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male',
                              style: CustomTextStyles.lohit400style18
                                  .copyWith(fontSize: 18.sp)),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female',
                              style: CustomTextStyles.lohit400style18
                                  .copyWith(fontSize: 18.sp)),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    TextFormField(
                      controller: _heightController,
                      decoration: InputDecoration(
                          labelText: 'Height (cm)',
                          labelStyle: CustomTextStyles.lohit500style18
                              .copyWith(fontSize: 18.sp)),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your height';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _weightController,
                      decoration: InputDecoration(
                          labelText: 'Weight (kg)',
                          labelStyle: CustomTextStyles.lohit500style18
                              .copyWith(fontSize: 18.sp)),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your weight';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                          labelText: 'Age',
                          labelStyle: CustomTextStyles.lohit500style18
                              .copyWith(fontSize: 18.sp)),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _calculateBmiAndCalories();
                        }
                      },
                      child: Text(
                        'Calculate BMI and Calories',
                        style: CustomTextStyles.lohit500style18
                            .copyWith(color: AppColors.offwhite, fontSize: 18.sp),
                      ),
                    ),
                    if (_bmi != null && _calories != null) ...[
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your BMI: ',
                              style: CustomTextStyles.lohit500style20
                                  .copyWith(fontSize: 20.sp)),
                          Text(_bmi!.toStringAsFixed(2),
                              style: CustomTextStyles.lohit400style18
                                  .copyWith(fontSize: 18.sp))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight status: ',
                              style: CustomTextStyles.lohit500style20
                                  .copyWith(fontSize: 20.sp)),
                          Text('$_weightStatus',
                              style: CustomTextStyles.lohit400style18
                                  .copyWith(fontSize: 18.sp))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your daily calories need: ',
                              style: CustomTextStyles.lohit500style20
                                  .copyWith(fontSize: 20.sp)),
                          Text('$_calories',
                              style: CustomTextStyles.lohit400style18
                                  .copyWith(fontSize: 18.sp))
                        ],
                      ),
                    ],
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                      ),
                      onPressed: _goToMealSectionPage,
                      child: Text(
                        'Your Plan',
                        style: CustomTextStyles.lohit500style18
                            .copyWith(color: AppColors.offwhite, fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
    );
  }
}
