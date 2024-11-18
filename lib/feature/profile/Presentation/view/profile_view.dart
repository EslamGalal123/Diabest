import 'package:cached_network_image/cached_network_image.dart';
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Widgets/custom_btn_profile.dart';
import 'package:diiabest/feature/auth/Presentation/Views/sign_in.dart';
import 'package:diiabest/feature/profile/Presentation/view/edit_profile_view.dart';
import 'package:diiabest/feature/profile/Presentation/widget/custom_profile_form.dart';
import 'package:diiabest/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getPatientData(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          title:  Text(AppStrings.patient,style:CustomTextStyles.lohit500style20 ,),
          centerTitle: true,
          actions: const [
            SingOutButton(),
          ],
        ),
        body: const ProfileBody(),
      ),
    );
  }
}

class SingOutButton extends StatelessWidget {
  const SingOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: const Icon(Icons.logout),
      onPressed: () {
        BlocProvider.of<ProfileCubit>(context).signOut();
      },
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetProfileSuccess) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(children: [
                BlocListener<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is SignOut) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                          (route) => false);
                    }
                    if (state is SignOut) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                          (route) => false);
                    }
                  },
                  child: Column(children: [
                     SizedBox(
                      height: 30.h,
                    ),
                    CachedNetworkImage(
                      imageUrl: '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, error, stackTrace) => Image.asset(
                        Assets.imagesImageProfilDoctor,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                    ),
                     SizedBox(
                      height: 15.h,
                    ),
                    Text(state.user.name,
                        style: CustomTextStyles.lohit500style20),
                  ]),
                ),
              SizedBox(
                  height: 20.h,
                ),
                CustomProfileForm(
                  user: state.user,
                ),
                 SizedBox(
                  height: 35.h,
                ),
                CustomBtnProfile(
                  text: AppStrings.editprofile,
                  //  Applocalizations.of(context)!.translatetext("editprofile"),
                  onPressed: () {
                    // customNavigate(context, "/editprofile");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileView()));
                  },
                ),
              ]),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
