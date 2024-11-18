import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Eating/presentation/widget/create_your_meal_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EatingView extends StatelessWidget {
  const EatingView({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text(
              AppStrings.mealPlanner,
              style: CustomTextStyles.lohit500style20.copyWith(fontSize: 20.sp),
            ),
            elevation: 0,
          ),
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: CreateYourMealForm(),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
