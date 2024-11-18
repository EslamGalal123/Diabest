import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn_profile.dart';
import 'package:diiabest/feature/auth/auth_cubit/auth_cubit.dart';
import 'package:diiabest/feature/doctor/cubit/doctor_cubit.dart';
import 'package:diiabest/feature/doctor/presentation/views/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDoctorForm extends StatelessWidget {
  const ProfileDoctorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is GetProfileSuccess) {
          return Column(
            children: [
              SizedBox(
                height: 0.3.sh,
                child: CachedNetworkImage(
                  imageUrl: BlocProvider.of<AuthCubit>(context).currentUser.profileImage,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, error, stackTrace) => const Center(child: CircularProgressIndicator()),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Name: ",
                    style: CustomTextStyles.lohit500style20,
                  ),
                  SizedBox(width: 0.03.sw),
                  Text(
                    state.doctor.fullName,
                    style: CustomTextStyles.lohit400style18,
                  )
                ],
              ),
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  Text(
                    'Specialization:',
                    style: CustomTextStyles.lohit500style20,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(width: 0.03.sw),
                  Text(
                    state.doctor.specialization,
                    style:  CustomTextStyles.lohit400style18,
                  )
                ],
              ),
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  Text(
                    "Phone Number:",
                    style: CustomTextStyles.lohit500style20,
                  ),
                  SizedBox(width: 0.03.sw),
                  Text(
                    state.doctor.phoneNumber,
                    style:  CustomTextStyles.lohit400style18,
                  )
                ],
              ),
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  Text(
                    "Address:",
                    style: CustomTextStyles.lohit500style20,
                  ),
                  SizedBox(width: 0.03.sw),
                  SizedBox(
                    width: 250,
                    child: Text(
                      state.doctor.clinicAddress,
                      style:  CustomTextStyles.lohit400style18,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  Text(
                    "WhatsApp:",
                    style: CustomTextStyles.lohit500style20,
                  ),
                  SizedBox(width: 0.03.sw),
                  Expanded(
                    child: Text(
                      state.doctor.whatsappLink,
                      style:  CustomTextStyles.lohit400style18,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              SizedBox(height: 0.02.sh),
              Row(
                children: [
                  Text(
                    "Facebook:",
                    style: CustomTextStyles.lohit500style20,
                  ),
                  SizedBox(width: 0.03.sw),
                  Expanded(
                    child: Text(
                      state.doctor.facebookLink,
                      style:  CustomTextStyles.lohit400style18,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              SizedBox(height: 0.09.sh),
              CustomBtnProfile(
                text: AppStrings.editprofile,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileDoctor(),
                    ),
                  );
                },
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
