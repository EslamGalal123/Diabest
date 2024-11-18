import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/custom_social_icons.dart';
import 'package:diiabest/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DescriptionsForm extends StatelessWidget {
  const DescriptionsForm({super.key, required this.doctor});
  final DoctorsModel doctor;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          width: width * 0.44,
          height: height * 0.21,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.grey,
              width: 2.0,
            ),
          ),
          child: ClipOval(
            child: Image.asset(
              Assets.imagesImageProfilDoctor,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        Row(
          children: [
            Text(
              "Name: ",
              //  Applocalizations.of(context)!.translatetext("Name  "),
              style: CustomTextStyles.lohit500style20,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            SizedBox(
              width: 250,
              child: Text(
                doctor.fullName,
                style: CustomTextStyles.lohit400style20.copyWith(color: AppColors.black2),
              ),
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          children: [
            Text(
              "Specialization: ",
              // Applocalizations.of(context)!.translatetext("specialization"),
              style: CustomTextStyles.lohit500style20,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              doctor.specialization,
              style: CustomTextStyles.lohit400style20.copyWith(color: AppColors.black2),
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          children: [
            Text(
              "Start Date: ",
              // Applocalizations.of(context)!.translatetext("specialization"),
              style: CustomTextStyles.lohit500style20,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              doctor.startTime,
              style: CustomTextStyles.lohit400style20.copyWith(color: AppColors.black2),
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          children: [
            Text(
              "End Data: ",
              // Applocalizations.of(context)!.translatetext("specialization"),
              style: CustomTextStyles.lohit500style20,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              doctor.endTime,
              style: CustomTextStyles.lohit400style20.copyWith(color: AppColors.black2),
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          children: [
            Text(
              "Phone Number: ",
              // Applocalizations.of(context)!.translatetext("phoneNumbe"),
              style: CustomTextStyles.lohit500style20,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            SizedBox(
              child: Text(
                doctor.phoneNumber,
                style: CustomTextStyles.lohit400style20.copyWith(color: AppColors.black2),
              ),
            )
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          children: [
            Text(
              "address: ",
              maxLines: 2,
//  Applocalizations.of(context)!.translatetext("clinicaddress")        ,
              style: CustomTextStyles.lohit500style20,
            ),
            SizedBox(
              width: width * 0.03,
            ),
            SizedBox(
              width: 220,
              child: Text(
                doctor.clinicAddress,
                style: CustomTextStyles.lohit400style20.copyWith(color: AppColors.black2,),
                maxLines: 2,
              ),
            )
          ],
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "contact Now",
              //  Applocalizations.of(context)!.translatetext("contactnow"),
              style: CustomTextStyles.lohit500style20,
            ),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSocialIcons(
              image: Assets.imagesImageFacebook,
              url: doctor.facebookLink,
            ),
            SizedBox(
              width: width * 0.04,
            ),
            CustomSocialIcons(
              image: Assets.imageswhatsapp,
              url: doctor.whatsappLink,
            ),
          ],
        ),
      ],
    );
  }
}
