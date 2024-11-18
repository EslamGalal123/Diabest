import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/Register_your_information/cubit/register_patient_cubit.dart';
import 'package:diiabest/feature/Register_your_information/presentation/widgets/information_adresses.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormInfoPage1 extends StatefulWidget {
  const CustomFormInfoPage1({Key? key}) : super(key: key);

  @override
  State<CustomFormInfoPage1> createState() => _CustomFormInfoPage1State();
}

class _CustomFormInfoPage1State extends State<CustomFormInfoPage1> {
  String? gender;
  String? diabeticcama;
  String? doyousmoke;
  String? familyhavediabetes;
  String? oral;
  String? breastfeeding;
  String? pregnant;
  String? presuremedications;
  String? takemedications;
  String? drinkachol;
  String? pancreasdisease;

  @override
  Widget build(BuildContext context) {
    gender = BlocProvider.of<AuthCubit>(context).gender;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(4.w), // Use screen util for padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InformationAdresses(text: AppStrings.doyousufferfromdiabeticcoma),
            SizedBox(height: 10.h), // Use screen util for height

            // Radio buttons for diabetic coma
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: 'true',
                  groupValue: diabeticcama,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .diabeticcama = val!;
                    setState(() {
                      diabeticcama = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.yes,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
                SizedBox(width: 80.w), // Use screen util for width
                Radio(
                  value: 'false',
                  groupValue: diabeticcama,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .diabeticcama = val!;
                    setState(() {
                      diabeticcama = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.no,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
              ],
            ),
            InformationAdresses(text: AppStrings.doyousmoke),
            SizedBox(height: 10.h), // Use screen util for height

            // Radio buttons for smoking
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: 'true',
                  groupValue: doyousmoke,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context).doyousmoke =
                        val!;
                    setState(() {
                      doyousmoke = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.yes,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
                SizedBox(width: 80.w), // Use screen util for width
                Radio(
                  value: 'false',
                  groupValue: doyousmoke,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context).doyousmoke =
                        val!;
                    setState(() {
                      doyousmoke = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.no,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
              ],
            ),
            InformationAdresses(
                text: AppStrings.doesanyoneinyourfamilyhavediabetes),
            SizedBox(height: 10.h), // Use screen util for height

            // Radio buttons for family history of diabetes
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: 'true',
                  groupValue: familyhavediabetes,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .familyhavediabetes = val!;
                    setState(() {
                      familyhavediabetes = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.yes,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
                SizedBox(width: 80.w), // Use screen util for width
                Radio(
                  value: 'false',
                  groupValue: familyhavediabetes,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .familyhavediabetes = val!;
                    setState(() {
                      familyhavediabetes = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.no,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
              ],
            ),
            InformationAdresses(
                text: AppStrings.doyouusebloodpresuremedications),
            SizedBox(height: 10.h), // Use screen util for height

            // Radio buttons for blood pressure medications
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: 'true',
                  groupValue: presuremedications,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .presuremedications = val!;
                    setState(() {
                      presuremedications = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.yes,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
                SizedBox(width: 80.w), // Use screen util for width
                Radio(
                  value: 'false',
                  groupValue: presuremedications,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .presuremedications = val!;
                    setState(() {
                      presuremedications = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.no,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
              ],
            ),
            InformationAdresses(
                text: AppStrings
                    .doyoutakemedicationforatheroscleriosisoranyheartdisease),
            SizedBox(height: 10.h), // Use screen util for height

            // Radio buttons for heart disease medications
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: 'true',
                  groupValue: takemedications,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .takemedications = val!;
                    setState(() {
                      takemedications = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.yes,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
                SizedBox(width: 80.w), // Use screen util for width
                Radio(
                  value: 'false',
                  groupValue: takemedications,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .takemedications = val!;
                    setState(() {
                      takemedications = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.no,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
              ],
            ),
            InformationAdresses(text: AppStrings.doyoudrinkalcholetc),
            SizedBox(height: 10.h), // Use screen util for height

            // Radio buttons for alcohol consumption
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: 'true',
                  groupValue: drinkachol,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context).drinkachol =
                        val!;
                    setState(() {
                      drinkachol = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.yes,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
                SizedBox(width: 80.w), // Use screen util for width
                Radio(
                  value: 'false',
                  groupValue: drinkachol,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context).drinkachol =
                        val!;
                    setState(() {
                      drinkachol = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.no,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
              ],
            ),
            InformationAdresses(
                text: AppStrings.doyouhavemedicationforanyhepaticdisease),
            SizedBox(height: 10.h), // Use screen util for height

            // Radio buttons for hepatic disease medications
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio(
                  value: 'true',
                  groupValue: pancreasdisease,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .pancreasdisease = val!;
                    setState(() {
                      pancreasdisease = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.yes,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
                SizedBox(width: 80.w), // Use screen util for width
                Radio(
                  value: 'false',
                  groupValue: pancreasdisease,
                  onChanged: (val) {
                    BlocProvider.of<RegisterPatientCubit>(context)
                        .pancreasdisease = val!;
                    setState(() {
                      pancreasdisease = val;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.w), // Use screen util for padding
                  child: Text(
                    AppStrings.no,
                    style: CustomTextStyles.lohit400style18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h), // Use screen util for height

            // Conditional rendering based on gender
            if (gender == AppStrings.female)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(Assets.imagesImageOpenmojiWoman,
                          width: 40.w, height: 40.h),
                      Text(
                        AppStrings.forfemale,
                        style: CustomTextStyles.lohit500style24
                            .copyWith(color: AppColors.black2),
                      )
                    ],
                  ),
                  InformationAdresses(
                      text: AppStrings.doyouhaveoralcontraceptives),
                  SizedBox(height: 10.h), // Use screen util for height

                  // Radio buttons for oral contraceptives
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        value: 'true',
                        groupValue: oral,
                        onChanged: (val) {
                          BlocProvider.of<RegisterPatientCubit>(context).oral =
                              val!;
                          setState(() {
                            oral = val;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(10.w), // Use screen util for padding
                        child: Text(
                          AppStrings.yes,
                          style: CustomTextStyles.lohit400style18,
                        ),
                      ),
                      SizedBox(width: 80.w), // Use screen util for width
                      Radio(
                        value: 'false',
                        groupValue: oral,
                        onChanged: (val) {
                          BlocProvider.of<RegisterPatientCubit>(context).oral =
                              val!;
                          setState(() {
                            oral = val;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(10.w), // Use screen util for padding
                        child: Text(
                          AppStrings.no,
                          style: CustomTextStyles.lohit400style18,
                        ),
                      ),
                    ],
                  ),
                  InformationAdresses(text: AppStrings.areyoupregnant),
                  SizedBox(height: 10.h), // Use screen util for height

                  // Radio buttons for pregnancy
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        value: 'true',
                        groupValue: pregnant,
                        onChanged: (val) {
                          BlocProvider.of<RegisterPatientCubit>(context)
                              .pregnant = val!;
                          setState(() {
                            pregnant = val;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(10.w), // Use screen util for padding
                        child: Text(
                          AppStrings.yes,
                          style: CustomTextStyles.lohit400style18,
                        ),
                      ),
                      SizedBox(width: 80.w), // Use screen util for width
                      Radio(
                        value: 'false',
                        groupValue: pregnant,
                        onChanged: (val) {
                          BlocProvider.of<RegisterPatientCubit>(context)
                              .pregnant = val!;
                          setState(() {
                            pregnant = val;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(10.w), // Use screen util for padding
                        child: Text(
                          AppStrings.no,
                          style: CustomTextStyles.lohit400style18,
                        ),
                      ),
                    ],
                  ),
                  InformationAdresses(text: AppStrings.areyoubreastfeeding),
                  SizedBox(height: 10.h), // Use screen util for height

                  // Radio buttons for breastfeeding
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                        value: 'true',
                        groupValue: breastfeeding,
                        onChanged: (val) {
                          BlocProvider.of<RegisterPatientCubit>(context)
                              .breastfeeding = val!;
                          setState(() {
                            breastfeeding = val;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(10.w), // Use screen util for padding
                        child: Text(
                          AppStrings.yes,
                          style: CustomTextStyles.lohit400style18,
                        ),
                      ),
                      SizedBox(width: 80.w), // Use screen util for width
                      Radio(
                        value: 'false',
                        groupValue: breastfeeding,
                        onChanged: (val) {
                          BlocProvider.of<RegisterPatientCubit>(context)
                              .breastfeeding = val!;
                          setState(() {
                            breastfeeding = val;
                          });
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(10.w), // Use screen util for padding
                        child: Text(
                          AppStrings.no,
                          style: CustomTextStyles.lohit400style18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
