/*
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/Register_your_information/presentation/views/register_your_information.dart';
import 'package:diiabest/feature/auth/Presentation/widgets/signup_radio.dart';
import 'package:diiabest/feature/auth/auth_cubit/autch_state.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomSignUpForm extends StatefulWidget {
   CustomSignUpForm({Key? key}) : super(key: key);

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
bool isPasswordObscure = true;

   bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
        if (state is SignUpSuccess) {
          if (state.currentUser.role == AppStrings.patient) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPatientInformation(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DoctorView(),
              ),
            );
          }
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).fullName,
              labelText: AppStrings.fullname,
              onChanged: (fristName) {},
            ),
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).nationalID,
              labelText: AppStrings.nationalID,
              onChanged: (lastName) {},
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              margin: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.grey),
              ),
              child: PopupMenuButton(
                icon: Container(
                  child: Row(
                    children: [
                      Text(
                        BlocProvider.of<AuthCubit>(context).gender ?? "Gender",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
                onSelected: (value) {
                  BlocProvider.of<AuthCubit>(context).gender = value.toString();
                },
                itemBuilder: (context) {
                  return [
                     PopupMenuItem(
                      value: AppStrings.male,
                      child: Text(
                        "Male",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                     PopupMenuItem(
                      value: AppStrings.female,
                      child: Text(
                        "Female",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ];
                },
              ),
            ),
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).emailAddress,
              labelText: AppStrings.emailAddress,
              prefixIcon: const Icon(Icons.email),
              onChanged: (email) {},
            ),
            CustomTextFormField(

              mycontroller: BlocProvider.of<AuthCubit>(context).password,
              labelText: AppStrings.password,
              obscureText: isPasswordObscure,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: (isPasswordObscure == true)?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                onPressed: () {
                  setState(() {
                    isPasswordObscure =! isPasswordObscure;
                  });
                },),
              onChanged: (password) {},
            ),
            CustomTextFormField(
              mycontroller: BlocProvider.of<AuthCubit>(context).confirmThePassword,
              labelText: AppStrings.confirmThePassword,
              obscureText: isConfirmPasswordObscure,
              suffixIcon: IconButton(
                icon: (isConfirmPasswordObscure == true)?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                onPressed: (){
                  setState(() {
                    isConfirmPasswordObscure =! isConfirmPasswordObscure;
                  });
                },
              ),
              prefixIcon: const Icon(Icons.lock),
              onChanged: (password) {},
            ),
            SizedBox(height: 10.h),
            const SignUpRadio(),
          ],
        ),
      ),
    );
  }
}

*/

import 'package:diiabest/feature/auth/Presentation/widgets/signup_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Utils/App-String.dart';
import '../../../../core/Utils/App-colors.dart';
import '../../../../core/Widgets/custom_text_field.dart';
import '../../../Register_your_information/presentation/views/register_your_information.dart';
import '../../../doctor/presentation/views/doctor_view.dart';
import '../../auth_cubit/autch_state.dart';
import '../../auth_cubit/auth_cubit.dart';

// ignore: must_be_immutable
class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

enum Gender { Male, Female }

Gender? selectedGender;

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  String? gender;
  String? selectedGender;
  bool isExpanded = false;
  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
        if (state is SignUpSuccess) {
          if (state.currentUser.role == AppStrings.patient) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterPatientInformation()));
            // customNavigate(context, "/registerYourInformation");
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DoctorView(),
              ),
            );
            // customNavigate(context, "/doctor");
          }
        }
      },
      child: Column(children: [
        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).fullName,
          labelText: AppStrings.fullname,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
          },
          //  Applocalizations.of(context)!.translatetext("fullname"),
          onChanged: (fristName) {},
        ),
        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).nationalID,
          labelText: AppStrings.nationalID,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            if (value.length != 14){
              return "your national ID not correct";
            }
          },
          // Applocalizations.of(context)!.translatetext("nationalID"),
          onChanged: (lastName) {},
        ),

        Container(
            padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
            margin: EdgeInsets.only(
              top: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.grey),
            ),
            child: PopupMenuButton(
              icon: Container(
                child: Row(
                  children: [
                    Text(
                      selectedGender ?? "Gender",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              onSelected: (value) {
                setState(() {
                  selectedGender = value;
                });
                BlocProvider.of<AuthCubit>(context).gender = value;
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: AppStrings.male,
                    child: const Text(
                      "Male",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  PopupMenuItem(
                    value: AppStrings.female,
                    child: const Text(
                      "Female",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ];
              },
            )
            // ExpansionTile(
            //  title: Text(isExpanded ? selectedGender ?? "Gender" : "Gender"),
            //   onExpansionChanged: (expanded) {
            //     setState(() {
            //       isExpanded = expanded;
            //     });
            //   },
            //   tilePadding: EdgeInsets.zero,
            //   childrenPadding: EdgeInsets.symmetric(horizontal: 16),
            //   children: [
            //     ListTile(
            //       title:const Text("Male"),
            //       onTap: () {
            //         BlocProvider.of<AuthCubit>(context).gender=AppStrings.male;

            //         setState(() {
            //           selectedGender = "Male";
            //            isExpanded = true;
            //         });
            //       },
            //     ),
            //     ListTile(
            //       title:const Text("Female"),
            //       onTap: () {
            //           BlocProvider.of<AuthCubit>(context).gender=AppStrings.female;
            //         setState(() {
            //           selectedGender = "Female";
            //            isExpanded = true;
            //         });
            //         // استدعاء الدالة المسؤولة عن إرسال القيمة إلى الخادم
            //         // sendDataToServer(selectedGender);
            //       },
            //     ),
            //   ],
            // ),
            ),

        //   Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       //  InformationAdresses(text: AppStrings.gender),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Radio(
        //               value: AppStrings.male,
        //               groupValue: gender ?? AppStrings.male,
        //               onChanged: (value) {
        //                 BlocProvider.of<AuthCubit>(context).gender = value!;
        //                 setState(() {
        //                   gender = value;
        //                 });
        //               }),
        //           Text(
        //             AppStrings.male,
        //             //  Applocalizations.of(context)!.translatetext("patient"),
        //             style: Theme.of(context).textTheme.titleSmall,),
        //           const SizedBox(
        //             width: 70,
        //           ),
        //           Radio(
        //               value: AppStrings.female,
        //               groupValue: gender,
        //               onChanged: (value) {
        //                 BlocProvider.of<AuthCubit>(context).gender = value!;
        //                 setState(() {
        //                   gender = value;
        //                 });
        //               }),
        //           Text(
        //             AppStrings.female,
        //             //  Applocalizations.of(context)!.translatetext("patient"),
        //             style: Theme.of(context).textTheme.titleSmall,)
        //         ],
        //       ),
        //     ],
        //   ),
        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).emailAddress,
          labelText: AppStrings.emailAddress,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            if (!value.contains('@') ||
                !value.contains('.') ||
                !value.contains('gmail')) {
              return 'your email not correct';
            }
            return null;
          },
          // Applocalizations.of(context)!.translatetext("emailAddress"),
          prefixIcon: const Icon(Icons.email),
          onChanged: (email) {},
        ),
        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).password,
          labelText: AppStrings.password,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (BlocProvider.of<AuthCubit>(context)
                    .password
                    .text
                    .length <
                6) {
              return "password should be at least 6 letters";
            }
          },
          obscureText: isPasswordObscure,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: (isPasswordObscure == true)
                ? Icon(Icons.visibility_off_outlined)
                : Icon(Icons.visibility_outlined),
            onPressed: () {
              setState(() {
                isPasswordObscure = !isPasswordObscure;
              });
            },
          ),
          onChanged: (password) {},
        ),
        CustomTextFormField(
          mycontroller: BlocProvider.of<AuthCubit>(context).confirmThePassword,
          labelText: AppStrings.confirmThePassword,
          obscureText: isConfirmPasswordObscure,
          validation: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (BlocProvider.of<AuthCubit>(context)
                    .confirmThePassword
                    .text
                    .length <
                6) {
              return "password should be at least 6 letters";
            } else if (BlocProvider.of<AuthCubit>(context).password.text !=
                BlocProvider.of<AuthCubit>(context).confirmThePassword.text) {
              return "your password not matching";
            }
          },
          suffixIcon: IconButton(
            icon: (isConfirmPasswordObscure == true)
                ? Icon(Icons.visibility_off_outlined)
                : Icon(Icons.visibility_outlined),
            onPressed: () {
              setState(() {
                isConfirmPasswordObscure = !isConfirmPasswordObscure;
              });
            },
          ),
          prefixIcon: const Icon(Icons.lock),
          onChanged: (password) {},
        ),
        SizedBox(height: height * 0.01),

        const SignUpRadio(),
      ]),
    );
  }
}
