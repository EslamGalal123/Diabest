import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/doctors_patient/Presentation/widget/card_doctor_patient.dart';
import 'package:diiabest/feature/doctors_patient/cubit/doctor_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomPatientDoctorForm extends StatelessWidget {
  const CustomPatientDoctorForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.imagesImageDoctor),
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: Text(AppStrings.doctor,
                  //  Applocalizations.of(context)!.translatetext("doctor"),
                  style: CustomTextStyles.lohit500style22),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            controller:
                BlocProvider.of<DoctorPatientCubit>(context).searchController,
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle:CustomTextStyles.lohit400style18 ,
              
              // Applocalizations.of(context)!.translatetext("Search"),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
            onChanged: (value) {
              BlocProvider.of<DoctorPatientCubit>(context).searchDoctor();
            },
          ),
        ),
       SizedBox(
          height: 5.h,
        ),
        BlocBuilder<DoctorPatientCubit, DoctorPatientState>(
          builder: (context, state) {
            if (state is GetAllDoctorSuccess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: state.doctors.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardPatientDoctor(
                        doctor: state.doctors[index],
                      );
                    }),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
