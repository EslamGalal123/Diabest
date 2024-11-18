
// import 'package:flutter/material.dart';
// import 'package:testproject/Localizations/applocalizations.dart';
// import 'package:testproject/core/Utils/App-String.dart';
// import 'package:testproject/core/Utils/App-TextStyles.dart';
// import 'package:testproject/core/Utils/App-colors.dart';

// class RegisterYourInformationPage2 extends StatelessWidget {
//   const RegisterYourInformationPage2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           AppStrings.registerYourInformation,
//           // Applocalizations.of(context)!.translatetext("registerYourInformation"),
//           style: CustomTextStyles.lohit500style24,
//           ),
//         elevation: 0,
//         backgroundColor: AppColors.offwhite,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//            const  SliverToBoxAdapter(child:CustomFormInfoPage2()),
//            const  SliverToBoxAdapter(child:SizedBox(height: 7,)),
//              SliverToBoxAdapter(child:CustomBtn(text: AppStrings.next,onPressed: () {
//                customNavigate(context, "/CustomBtnNavigation");
//              },)),
             
//              ])));
//   }
// }