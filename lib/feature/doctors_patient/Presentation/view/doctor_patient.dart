import 'package:diiabest/feature/doctors_patient/Presentation/widget/custom_patient-doctor_form.dart';
import 'package:diiabest/feature/doctors_patient/cubit/doctor_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DoctorPatientView extends StatelessWidget {
  const DoctorPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorPatientCubit()..getAllDoctor(),
      child: const Scaffold(
          body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 20,
                )),
                SliverToBoxAdapter(child: CustomPatientDoctorForm()),
              ],
            )),
      )),
    );
  }
}
