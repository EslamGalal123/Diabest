// import 'package:diabestapp/Core/Utils/App-String.dart';
// import 'package:diabestapp/Core/Utils/App-TextStyles.dart';
// import 'package:diabestapp/Core/Widgets/custom_btn.dart';
// import 'package:diabestapp/Core/functions/Navigation.dart';
// import 'package:diabestapp/Features/Register_your_information/data/information_data.dart';
// import 'package:flutter/material.dart';

// class CustomFormInfoPage3 extends StatefulWidget {
//   const CustomFormInfoPage3({super.key});

//   @override
//   State<CustomFormInfoPage3> createState() => _CustomFormInfoPage3State();
// }

// class _CustomFormInfoPage3State extends State<CustomFormInfoPage3> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//      const   SizedBox(height: 10,),
      
//         for (var i = 0; i < activityLevel.length; i++)
//                 RadioListTile(
//                   value: i == 0 ? 0 : false,
//                   groupValue: i == 0 ? 0 : 2,
//                   onChanged: (v) {
//                     setState(() {
                     
//                     });
//                   },
//                   title: Text(
//                     activityLevel[i],
//                     style: CustomTextStyles.lohit500style20
//                   ),
//                 ),
//               // const SizedBox(height: 50,),
              
                 
//                   const SizedBox(height: 240,),
//                    CustomBtn(text: AppStrings.done,onPressed: (){
//                    customNavigate(context, "/CustomBtnNavigation");
//                    }),
                 
                
//       ],
//     );
//   }
// }