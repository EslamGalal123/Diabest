import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Widgets/custom_info_for_patient.dart';
import 'package:diiabest/core/Widgets/custom_text_field.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/widgets/image_of_doctor.dart';
import 'package:diiabest/feature/profile/Presentation/view/edit_profile_password.dart';
import 'package:diiabest/feature/profile/Presentation/view/profile_view.dart';
import 'package:diiabest/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CustomEditProfile extends StatelessWidget {
  CustomEditProfile({super.key});
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).fullName.text =
        BlocProvider.of<AuthCubit>(context).currentUser.fullName;
    return Expanded(
      child: ListView(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              child: const ImagePickerView()),
          CustomTextFormField1(
            mycontroller: BlocProvider.of<ProfileCubit>(context).fullName,
            labelText: "fullName",
            enable: false,
          ),
          const CustomInfoForPatient(),
          const SizedBox(
            height: 30,
          ),
          BlocListener<ProfileCubit, ProfileState>(
            listener: (context, state) {
              if (state is UpdateProfileSuccess) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileView(),
                    ),
                    (route) => false);
              }
              if (state is UpdateProfileFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errMessage),
                  ),
                );
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<ProfileCubit>(context).updateProfile();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF246BFE),
                      minimumSize: const Size(0, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    child: const Text(
                      AppStrings.saveprofile,
                      // Applocalizations.of(context)!.translatetext("saveprofile"),
                      style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.white,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordView(),
                      ),
                    );
                  },
                  child: const Text(
                    AppStrings.changepassword
                    // Applocalizations.of(context)!.translatetext("changepassword")
                    ,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
