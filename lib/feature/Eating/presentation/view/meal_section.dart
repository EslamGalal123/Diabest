
// import 'package:flutter/material.dart';
// import 'package:testproject/feature/Eating/presentation/widget/custom_meal_section.dart';
// import 'package:testproject/core/Utils/App-String.dart';
// import 'package:testproject/core/Utils/App-TextStyles.dart';

// class MealSection extends StatelessWidget {
//   const MealSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   Scaffold(
//       appBar: AppBar(
//        title:const Text(AppStrings.mealsections,style: CustomTextStyles.lohit500style20,),
//        elevation: 0,
//     ),
//       body:const SafeArea(
//         child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 7.0),
//               child: CustomScrollView(
//                   physics:  BouncingScrollPhysics(),
//                   slivers: [
//                      SliverToBoxAdapter(
//                         child: MealSectionPageForm()
//                         ),
                        
//                         ]))));
//   }
// }