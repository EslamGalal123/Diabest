import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/high_blood_suger.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/information.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/low_blood_suger.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/pregnancy_adress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // استيراد flutter_screenutil

class CustomPregnancyForm extends StatefulWidget {
  const CustomPregnancyForm({Key? key}) : super(key: key);

  @override
  State<CustomPregnancyForm> createState() => _CustomPregnancyFormState();
}

class _CustomPregnancyFormState extends State<CustomPregnancyForm> {
  List<bool> isCheckedList = [false, false];
  bool showField1 = false;
  bool showField2 = false;


  @override
  Widget build(BuildContext context) {
double widthScreen = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenUtil().setHeight(10), // استخدام ScreenUtil لتعيين ارتفاع العنصر
        ),

        SizedBox(
          height: ScreenUtil().setHeight(15),
        ),
        PregnancyAdress(text: "Blood Suger Level"),
        Row(
          children: [
            Checkbox(
              value: isCheckedList[0],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[0] = value ?? false;
                  isCheckedList[1] = !isCheckedList[0];
                  if (isCheckedList[0]) {
                    showField1 = true;
                    showField2 = false;
                  } else {
                    showField1 = false;
                  }
                });
              },
            ),
            Text(
              "High",
              style: CustomTextStyles.lohit400style20.copyWith(
                fontSize: ScreenUtil().setSp(20), // تعيين حجم النص باستخدام ScreenUtil
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(86)),
            Checkbox(
              value: isCheckedList[1],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[1] = value ?? false;
                  isCheckedList[0] = !isCheckedList[1];
                  if (isCheckedList[1]) {
                    showField1 = false;
                    showField2 = true;
                  } else {
                    showField1 = false;
                  }
                });
              },
            ),
            Text(
              'Low',
              style: CustomTextStyles.lohit400style20.copyWith(
                fontSize: ScreenUtil().setSp(20), // تعيين حجم النص باستخدام ScreenUtil
              ),
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(25),
        ),
        Row(
          children: [
            Image.asset(
              Assets.hand,
              width: ScreenUtil().setWidth(50), // تعيين عرض الصورة باستخدام ScreenUtil
            ),
            Text(
              "Things to be careful of",
              style:CustomTextStyles.lohit400style20.copyWith(color: Colors.blue)
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(15),
            left: ScreenUtil().setWidth(25),
            bottom: ScreenUtil().setHeight(15),
          ),
          child: Column(
            children: [
              PregnancyInformation(text: "obesity.", width: widthScreen *0.75,),
              PregnancyInformation(text: "extreme thinness.", width: widthScreen *0.75,),
              PregnancyInformation(text: "polycystic ovary syndrome.", width: widthScreen *0.75,),
              PregnancyInformation(
                  text: "giving birth to a baby weighing more than 4.5 kg .", width: widthScreen *0.75,),
              SizedBox(
                height: ScreenUtil().setHeight(15),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ScreenUtil().setWidth(35),
                  ),
                  Text(
                    "OR ELSE",
                    style: CustomTextStyles.lohit500style20.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20), // تعيين حجم النص باستخدام ScreenUtil
                    ),
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(12),
              ),
              PregnancyInformation(
                text:
                    "Your risk of getting pregnancy diabetes will increase.", width: widthScreen *0.75,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(12),
              ),
            ],
          ),
        ),
        if (showField1) HighBloodSuger(),
        if (showField2) LowBloodSuger(),
      ],
    );
  }
}
