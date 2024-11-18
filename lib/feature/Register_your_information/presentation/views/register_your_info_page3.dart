// import 'package:diabestapp/Core/Utils/App-String.dart';
// import 'package:diabestapp/Core/Utils/App-colors.dart';
// import 'package:diabestapp/Features/Register_your_information/presentation/widgets/custom_form_info_page3.dart';
// import 'package:diabestapp/Localizations/applocalizations.dart';
// import 'package:flutter/material.dart';

// class RegisterYourInformationPage3 extends StatelessWidget {
//   const RegisterYourInformationPage3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//            Applocalizations.of(context)!.translatetext("registerYourInformation"),
//             style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: "poppins",
//                 color: AppColors.black2),
//           ),
//           elevation: 0,
//           backgroundColor: AppColors.offwhite,
//         ),
//         body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: CustomScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 slivers: [
//                   SliverToBoxAdapter(
//                       child: Text(AppStrings.activityLevel,
//                           style: Theme.of(context).textTheme.bodyMedium,
//                           textAlign: TextAlign.start)),
//                                   const SliverToBoxAdapter(child: SizedBox(height: 7,)),

//                   SliverToBoxAdapter(
//                       child: Text('Basal Metabolic Rate (BMR)',
//                           style: Theme.of(context).textTheme.bodyMedium,
//                           textAlign: TextAlign.center)),

//                   const SliverToBoxAdapter(child: CustomFormInfoPage3()),
//                 ])));
//   }
// }
