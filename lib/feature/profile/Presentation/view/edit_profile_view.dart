import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/profile/Presentation/widget/custom_edit_profile.dart';
import 'package:diiabest/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.editprofile,
            // Applocalizations.of(context)!.translatetext("editprofile"),
            style: CustomTextStyles.lohit500style22,
          ),
          elevation: 0,
        ),
        body: const EditPofileBody(),
      ),
    );
  }
}

class EditPofileBody extends StatelessWidget {
  const EditPofileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Form(
          key:   BlocProvider.of<ProfileCubit>(context).formKey,
          child: Column(
            children: [
              CustomEditProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
