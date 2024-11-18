// import 'package:diabestapp/Core/Utils/App-String.dart';
// import 'package:diabestapp/Core/Utils/App-TextStyles.dart';
// import 'package:diabestapp/Core/Utils/App-colors.dart';
// import 'package:diabestapp/Features/Register_your_information/presentation/widgets/information_adresses.dart';
// import 'package:flutter/material.dart';

// class CustomFormInfoPage2 extends StatefulWidget {
//   const CustomFormInfoPage2({super.key});

//   @override
//   State<CustomFormInfoPage2> createState() => _CustomFormInfoPage2State();
// }

// class _CustomFormInfoPage2State extends State<CustomFormInfoPage2> {
//   String? presuremedications;
//   String? takemedications;
//   String? drinkachol;
//   String?pancreasdisease;
//   String?oral;
//   String?breastfeeding;
//   String?pregnant;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InformationAdresses(text: AppStrings.doyouusebloodpresuremedications),
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Radio(
//                 value: 'yes',
//                 groupValue: presuremedications,
//                 onChanged: (val) {
//                   setState(() {
//                     presuremedications = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 AppStrings.yes,
//                 style: CustomTextStyles.lohit400style18,
//               ),
//             ),
//             const SizedBox(
//               width: 80,
//             ),
//             Radio(
//                 value: 'no',
//                 groupValue: presuremedications,
//                 onChanged: (val) {
//                   setState(() {
//                     presuremedications = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 AppStrings.no,
//                 style: CustomTextStyles.lohit400style18,
//               ),
//             ),
//           ],
//         ),
//         InformationAdresses(text: AppStrings.doyoutakemedicationforatheroscleriosisoranyheartdisease),
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Radio(
//                 value: 'yes',
//                 groupValue: takemedications,
//                 onChanged: (val) {
//                   setState(() {
//                     takemedications = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.yes,style: CustomTextStyles.lohit400style18,),
//             ),
//             const SizedBox(
//               width: 80,
//             ),
//             Radio(
//                 value: 'no',
//                 groupValue: takemedications,
//                 onChanged: (val) {
//                   setState(() {
//                     takemedications = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.no,style: CustomTextStyles.lohit400style18,),
//             ),
            
//           ],
//         ),
//         InformationAdresses(text: AppStrings.doyoudrinkalcholetc),
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Radio(
//                 value: 'yes',
//                 groupValue: drinkachol,
//                 onChanged: (val) {
//                   setState(() {
//                     drinkachol = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.yes,style: CustomTextStyles.lohit400style18,),
//             ),
//             const SizedBox(
//               width: 80,
//             ),
//             Radio(
//                 value: 'no',
//                 groupValue: drinkachol,
//                 onChanged: (val) {
//                   setState(() {
//                     drinkachol= val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.no,style: CustomTextStyles.lohit400style18,),
//             ),
            
//           ],
//         ),
//         InformationAdresses(text: AppStrings.doyouhavemedicationforanyhepaticdisease),
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Radio(
//                 value: 'yes',
//                 groupValue: pancreasdisease,
//                 onChanged: (val) {
//                   setState(() {
//                     pancreasdisease = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.yes,style: CustomTextStyles.lohit400style18,),
//             ),
//             const SizedBox(
//               width: 80,
//             ),
//             Radio(
//                 value: 'no',
//                 groupValue: pancreasdisease,
//                 onChanged: (val) {
//                   setState(() {
//                     pancreasdisease = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.no,style: CustomTextStyles.lohit400style18,),
//             ),
            
//           ],
//         ),
//          Row(
//           children: [
//             Icon(Icons.woman_2_outlined,size: 50,color: AppColors.primarycolor,),
//             Text(AppStrings.forfemale,style: CustomTextStyles.lohit500style24.copyWith(color: AppColors.primarycolor),)
//           ],
//         ),
//         InformationAdresses(text: AppStrings.doyouhaveoralcontraceptives),
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Radio(
//                 value: 'yes',
//                 groupValue: oral,
//                 onChanged: (val) {
//                   setState(() {
//                     oral = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.yes,style: CustomTextStyles.lohit400style18,),
//             ),
//             const SizedBox(
//               width: 80,
//             ),
//             Radio(
//                 value: 'no',
//                 groupValue: oral,
//                 onChanged: (val) {
//                   setState(() {
//                     oral = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.no,style: CustomTextStyles.lohit400style18,),
//             ),
            
//           ],
//         ),
//         InformationAdresses(text: AppStrings.areyoupregnant),
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Radio(
//                 value: 'yes',
//                 groupValue: pregnant,
//                 onChanged: (val) {
//                   setState(() {
//                    pregnant = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.yes,style: CustomTextStyles.lohit400style18,),
//             ),
//             const SizedBox(
//               width: 80,
//             ),
//             Radio(
//                 value: 'no',
//                 groupValue: pregnant,
//                 onChanged: (val) {
//                   setState(() {
//                     pregnant = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.no,style: CustomTextStyles.lohit400style18,),
//             ),
            
//           ],
//         ),
//         InformationAdresses(text: AppStrings.areyoubreastfeeding),
//         const SizedBox(
//           height: 7,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Radio(
//                 value: 'yes',
//                 groupValue: breastfeeding,
//                 onChanged: (val) {
//                   setState(() {
//                    breastfeeding = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.yes,style: CustomTextStyles.lohit400style18,),
//             ),
//             const SizedBox(
//               width: 80,
//             ),
//             Radio(
//                 value: 'no',
//                 groupValue: breastfeeding,
//                 onChanged: (val) {
//                   setState(() {
//                     breastfeeding = val;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child:   Text(AppStrings.no,style: CustomTextStyles.lohit400style18,),
//             ),
            
//           ],
//         )
       
//       ],
//     );
//   }
// }
