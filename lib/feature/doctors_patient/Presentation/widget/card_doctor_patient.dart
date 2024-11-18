import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/doctors_patient/Presentation/view/description_of_doctor.dart';
import 'package:diiabest/feature/doctors_patient/cubit/doctor_patient_cubit.dart';
import 'package:diiabest/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardPatientDoctor extends StatelessWidget {
  const CardPatientDoctor({
    super.key,
    required this.doctor,
  });
  final DoctorsModel doctor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DescriptionsOfDoctor(
              doctor: doctor,
            ),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: AppColors.lightGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.60,
              child: Text(
                doctor.fullName,
                style: CustomTextStyles.lohit500style22,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  BlocProvider.of<DoctorPatientCubit>(context).getDoctorImage(
                    specialization: doctor.specialization,
                  ),
                  width: 42,
                  height: 42,
                ),
                Text(
                  doctor.specialization,
                  style: CustomTextStyles.lohit500style14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
