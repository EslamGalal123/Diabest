import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Eating/presentation/view/eating_view.dart';
import 'package:diiabest/feature/Home/presentatio/widgets/custom_list_tile.dart';
import 'package:diiabest/feature/organs/presentation/view/organs_search.dart';
import 'package:diiabest/feature/pregnancy/presentation/view/pregnancy_view.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/view/reminder_medicin.dart';
import 'package:diiabest/feature/sports/presentation/Sports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHome extends StatelessWidget {
  const CustomHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              Assets.imagesLogo2,
              width: 108.w,
              height: 105.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.diabest,
                      style: TextStyle(
                          letterSpacing: 3,
                          color: AppColors.black1,
                          fontFamily: "poppins",
                          fontSize: 44.sp,
                          fontWeight: FontWeight.bold)),
                  Text(
                    AppStrings.enjayyourlifewithdiabest,
                    maxLines: 1,
                    style: CustomTextStyles.lohit300style16.copyWith(
                      color: AppColors.red,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        CustomListTileInHome(
          titlehome: AppStrings.organs,
          //  Applocalizations.of(context)!.translatetext("organs"),
          subtitlehome: AppStrings.neew,
          // Applocalizations.of(context)!.translatetext("neew"),
          leadinghome: Assets.imagesorgans,
          onpressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const OrgansView()));
            // customNavigate(context, "/organsView");
          },
        ),
        CustomListTileInHome(
          titlehome: AppStrings.reminderMedicins,
          // Applocalizations.of(context)!.translatetext("reminderMedicins"),
          subtitlehome: AppStrings.neew,

          //  Applocalizations.of(context)!.translatetext("neew"),
          leadinghome: Assets.imagesImagePill,
          onpressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReminderMedicinsView()));
            // customNavigate(context, "/ReminderMedicinsView");
          },
        ),
        CustomListTileInHome(
          titlehome: AppStrings.eating,
          //  Applocalizations.of(context)!.translatetext("eating"),
          subtitlehome: AppStrings.neew,

          //  Applocalizations.of(context)!.translatetext("neew"),
          leadinghome: Assets.imagesImageMeal,
          onpressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EatingView()));
            // customNavigate(context, "/eatingview");
          },
        ),
        CustomListTileInHome(
          titlehome: AppStrings.sprts,
          // Applocalizations.of(context)!.translatetext("sprts"),
          subtitlehome: AppStrings.neew,
          //  Applocalizations.of(context)!.translatetext("neew"),
          leadinghome: Assets.imagesImageSports,
          onpressed: () {
            // customNavigate(context, "/WorkoutPlanScreen");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        CustomListTileInHome(
          titlehome: AppStrings.pregnancy,
          //  Applocalizations.of(context)!.translatetext("pregnancy"),
          subtitlehome: AppStrings.neew,

          //  Applocalizations.of(context)!.translatetext("neew"),
          leadinghome: Assets.imagespregnancy,
          onpressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PregnancyView()));
            // customNavigate(context, "/PregnancyView");
          },
        )
      ],
    );
  }
}
