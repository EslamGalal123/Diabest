
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/information.dart';
import 'package:diiabest/feature/pregnancy/presentation/widget/pregnancy_adress.dart';
import 'package:flutter/material.dart';
class HighBloodSuger extends StatefulWidget {
  const HighBloodSuger({super.key});

  @override
  State<HighBloodSuger> createState() => _HighBloodSugerState();
}

class _HighBloodSugerState extends State<HighBloodSuger> {
  List<bool> isCheckedList = [false, false];
  bool showField1 = false;
  List<bool> isCheckedList2 = [false, false];
  bool showField2 = false;
  List<bool> isCheckedList3 = [false, false];
  bool showField3 = false;
  List<bool> isCheckedList4 = [false, false];
  bool showField4 = false;
  List<bool> isCheckedList5 = [false, false];
  bool showField5 = false;
  @override
  Widget build(BuildContext context) {
    double widthscreen=MediaQuery.of(context).size.width;
    return Column(
      children: [
        AddressPregnancy(text: "Do you suffer from extreme \nthirst?"),
        Row(
          children: [
            const SizedBox(
              width: 35,
            ),
            Checkbox(
              value: isCheckedList[0],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[0] = value ?? false;
                  isCheckedList[1] = !isCheckedList[0];
                  if (isCheckedList[0] = true) {
                    showField1 = true;
                  } else {
                    showField1 = false;
                  }
                });
              },
            ),
            Text(
              "Yes",
              style: CustomTextStyles.lohit400style20,
            ),
            const SizedBox(width: 86),
            Checkbox(
              value: isCheckedList[1],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList[1] = value ?? false;
                  isCheckedList[0] = !isCheckedList[1];
                  if (isCheckedList[1] = true) {
                    showField1 = false;
                  } else {
                    showField1 = true;
                  }
                });
              },
            ),
            Text(
              'No',
              style: CustomTextStyles.lohit400style20,
            ),
          ],
        ),
        if (showField1)
              Column(
            children: [
              const IfYes(),
              Container(
                margin:const EdgeInsets.only(top: 7,bottom: 10,left: 30),
                padding:const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Column(
                  children: [
                    PregnancyInformation(text: "Avoid high-fat foods", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text: "Monitor blood suger level 4 times daily", width: widthscreen * 0.7,),
                    PregnancyInformation(text: "Maintion a healthy weight", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text:
                            "Detect fetal movement and heart beats periodically", width: widthscreen * 0.7,),
                  ],
                ),
              ),
            ],
          ),
                    const SizedBox(height: 10,),

          //22222222
           AddressPregnancy(text: "Do you suffer from Nausea?"),
        Row(
          children: [
            const SizedBox(
              width: 35,
            ),
            Checkbox(
              value: isCheckedList2[0],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList2[0] = value ?? false;
                  isCheckedList2[1] = !isCheckedList2[0];
                  if (isCheckedList2[0] = true) {
                    showField2 = true;
                  } else {
                    showField2 = false;
                  }
                });
              },
            ),
            Text(
              "Yes",
              style: CustomTextStyles.lohit400style20,
            ),
            const SizedBox(width: 86),
            Checkbox(
              value: isCheckedList2[1],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList2[1] = value ?? false;
                  isCheckedList2[0] = !isCheckedList2[1];
                  if (isCheckedList[1] = true) {
                    showField2 = false;
                  } else {
                    showField2 = true;
                  }
                });
              },
            ),
            Text(
              'No',
              style: CustomTextStyles.lohit400style20,
            ),
          ],
        ),
        if (showField2)
              Column(
            children: [
             const  IfYes(),
              Container(
                margin:const EdgeInsets.only(top: 7,bottom: 10,left: 30),
                padding:const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Column(
                  children: [
                    PregnancyInformation(text: "Eat healthy food(fruits, vegetables,nuts)", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text: "Monitor blood suger level 4 times daily", width: widthscreen * 0.7,),
                    PregnancyInformation(text: "Maintion a healthy weight", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text:
                            "Detect fetal movement and heart beats periodically", width: widthscreen * 0.7,),
                  ],
                ),
              ),
            ],
          ),
                    const SizedBox(height: 10,),

          //33333333333333
           AddressPregnancy(text: "Do you suffer from frequent\nurination?"),
        Row(
          children: [
            const SizedBox(
              width: 35,
            ),
            Checkbox(
              value: isCheckedList3[0],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList3[0] = value ?? false;
                  isCheckedList3[1] = !isCheckedList3[0];
                  if (isCheckedList3[0] = true) {
                    showField3 = true;
                  } else {
                    showField3 = false;
                  }
                });
              },
            ),
            Text(
              "Yes",
              style: CustomTextStyles.lohit400style20,
            ),
            const SizedBox(width: 86),
            Checkbox(
              value: isCheckedList3[1],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList3[1] = value ?? false;
                  isCheckedList3[0] = !isCheckedList3[1];
                  if (isCheckedList3[1] = true) {
                    showField3 = false;
                  } else {
                    showField3 = true;
                  }
                });
              },
            ),
            Text(
              'No',
              style: CustomTextStyles.lohit400style20,
            ),
          ],
        ),
        if (showField3)
              Column(
            children: [
              const IfYes(),
              Container(
                margin:const EdgeInsets.only(top: 7,bottom: 10,left: 30),
                padding:const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Column(
                  children: [
                    PregnancyInformation(
                        text: "Monitor blood suger level 4 times daily", width: widthscreen * 0.7,),
                    PregnancyInformation(text: "Maintion a healthy weight", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text:
                            "Detect fetal movement and heart beats periodically", width:widthscreen * 0.7,),
                  ],
                ),
              ),
            ],
          ),
                    const SizedBox(height: 10,),

          //44444444444444
           AddressPregnancy(text: "Do you suffer from fatigue?"),
        Row(
          children: [
            const SizedBox(
              width: 35,
            ),
            Checkbox(
              value: isCheckedList4[0],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList4[0] = value ?? false;
                  isCheckedList4[1] = !isCheckedList4[0];
                  if (isCheckedList4[0] = true) {
                    showField4 = true;
                  } else {
                    showField4 = false;
                  }
                });
              },
            ),
            Text(
              "Yes",
              style: CustomTextStyles.lohit400style20,
            ),
            const SizedBox(width: 86),
            Checkbox(
              value: isCheckedList4[1],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList4[1] = value ?? false;
                  isCheckedList4[0] = !isCheckedList4[1];
                  if (isCheckedList4[1] = true) {
                    showField4 = false;
                  } else {
                    showField4 = true;
                  }
                });
              },
            ),
            Text(
              'No',
              style: CustomTextStyles.lohit400style20,
            ),
          ],
        ),
        if (showField4)
              Column(
            children: [
            const   IfYes(),
              Container(
                margin:const EdgeInsets.only(top: 7,bottom: 10,left: 30),
                padding:const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Column(
                  children: [
                    PregnancyInformation(text: "Avoid psychological pressure", width: widthscreen * 0.7,),
                                        PregnancyInformation(text: "Exercising regularly", width: widthscreen * 0.7,),
                    PregnancyInformation(text: "Enough sleep", width: widthscreen * 0.7,),

                    PregnancyInformation(
                        text: "Monitor blood suger level 4 times daily", width: widthscreen * 0.7,),
                    PregnancyInformation(text: "Maintion a healthy weight", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text:
                            "Detect fetal movement and heart beats periodically", width: widthscreen * 0.7,),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          ///55555555555555555
           AddressPregnancy(text: "Do you have any infection \n( skin , Vagina , Bladder )\nor blurred vision ?"),
        Row(
          children: [
            const SizedBox(
              width: 35,
            ),
            Checkbox(
              value: isCheckedList5[0],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList5[0] = value ?? false;
                  isCheckedList5[1] = !isCheckedList5[0];
                  if (isCheckedList5[0] = true) {
                    showField5 = true;
                  } else {
                    showField5 = false;
                  }
                });
              },
            ),
            Text(
              "Yes",
              style: CustomTextStyles.lohit400style20,
            ),
            const SizedBox(width: 86),
            Checkbox(
              value: isCheckedList5[1],
              onChanged: (bool? value) {
                setState(() {
                  isCheckedList5[1] = value ?? false;
                  isCheckedList5[0] = !isCheckedList5[1];
                  if (isCheckedList5[1] = true) {
                    showField5 = false;
                  } else {
                    showField5 = true;
                  }
                });
              },
            ),
            Text(
              'No',
              style: CustomTextStyles.lohit400style20,
            ),
          ],
        ),
        if (showField5)
              Column(
            children: [
             const  IfYes(),
              Container(
                margin:const EdgeInsets.only(top: 7,bottom: 10,left: 30),
                padding:const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Column(
                  children: [
                    PregnancyInformation(text: "Avoid high-fat foods", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text: "Monitor blood suger level 4 times daily", width: widthscreen * 0.7,),
                    PregnancyInformation(text: "Maintion a healthy weight", width: widthscreen * 0.7,),
                    PregnancyInformation(
                        text:
                            "Detect fetal movement and heart beats periodically", width: widthscreen * 0.7,),
                                      PregnancyInformation(text: "Adherence to the medications recommended by the doctor", width: widthscreen * 0.7,),

                  ],
                ),
              ),
            ],
          )
      ],
    );
  }
}
