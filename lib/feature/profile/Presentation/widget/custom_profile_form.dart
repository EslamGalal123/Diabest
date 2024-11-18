import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/models/patiant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileForm extends StatelessWidget {
  const CustomProfileForm({super.key, required this.user});
  final PatientModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Weight :",
              
              // "${Applocalizations.of(context)!.translatetext("weight")}"  "${"   85"}",
              style:CustomTextStyles.lohit500style18.copyWith(color: AppColors.black1)
            ),
             Text(
              "  ${user.weight}",
              // "${Applocalizations.of(context)!.translatetext("weight")}"  "${"   85"}",
              style: CustomTextStyles.lohit400style18.copyWith(color: AppColors.black2)
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Height :"
             ,
              // "${Applocalizations.of(context)!.translatetext("height")}"  "${"   185"}",
              style: CustomTextStyles.lohit500style18.copyWith(color: AppColors.black1)
            ),
             Text(
              "  ${user.height}",
              // "${Applocalizations.of(context)!.translatetext("height")}"  "${"   185"}",
              style:CustomTextStyles.lohit400style18.copyWith(color: AppColors.black2)
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
         Row(
              children: [
                Text(
                  "Gender :",
                  
                  // "${Applocalizations.of(context)!.translatetext("gender")}"  "${"    male"}",
                  style:CustomTextStyles.lohit500style18.copyWith(color: AppColors.black1)
                ),
                Text(
                  "  ${BlocProvider.of<AuthCubit>(context).gender}",
                  // "${Applocalizations.of(context)!.translatetext("gender")}"  "${"    male"}",
                  style: CustomTextStyles.lohit400style18.copyWith(color: AppColors.black2)
                ),
              ],
            ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Marital Status :",
              // "${ Applocalizations.of(context)!.translatetext("maritalStatus")}"  "${"    single"}",
              style:CustomTextStyles.lohit500style18.copyWith(color: AppColors.black1)
            ),
            Text(
              "  ${user.status}",
              // "${ Applocalizations.of(context)!.translatetext("maritalStatus")}"  "${"    single"}",
              style:CustomTextStyles.lohit400style18.copyWith(color: AppColors.black2)
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Age :",
              
              // "${Applocalizations.of(context)!.translatetext("age")}"  "${"   22"}",
              style: CustomTextStyles.lohit500style18.copyWith(color: AppColors.black1)
            ), Text(
              "  ${user.age}",
              // "${Applocalizations.of(context)!.translatetext("age")}"  "${"   22"}",
              style:CustomTextStyles.lohit400style18.copyWith(color: AppColors.black2)
            ),

          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Blood Suger Type : ",
             
              // "${Applocalizations.of(context)!.translatetext("Blood Suger Type :      ")}"  "${"type1"}",
              style: CustomTextStyles.lohit500style18.copyWith(color: AppColors.black1)
            ),
             Text(
              "  type1",
              // "${Applocalizations.of(context)!.translatetext("Blood Suger Type :      ")}"  "${"type1"}",
              style: CustomTextStyles.lohit400style18.copyWith(color: AppColors.black2)
            ),
          ],
        ),
      ],
    );
  }
}
