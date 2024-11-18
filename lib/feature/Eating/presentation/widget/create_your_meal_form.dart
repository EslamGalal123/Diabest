import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_btn_profile.dart';
import 'package:diiabest/feature/Eating/presentation/view/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateYourMealForm extends StatelessWidget {
  const CreateYourMealForm({super.key});

  @override
  Widget build(BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.howtoEatHealthyandAvoidFadDiets,
              height: 0.53.sh,
              width: 1.1.sw,   
            ),
            SizedBox(height: 20.h),
            CustomBtnProfile(
              text: AppStrings.createyourmealplan,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserInfoPage()),
                );
              },
            ),
          ],
    );
  }
}
