import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/doctors_patient/Presentation/widget/description_form.dart';
import 'package:diiabest/models/doctor_model.dart';
import 'package:flutter/material.dart';
class DescriptionsOfDoctor extends StatelessWidget {
  const DescriptionsOfDoctor({super.key, required this.doctor});
  final DoctorsModel doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          AppStrings.doctor,
          // Applocalizations.of(context)!.translatetext("doctor"),
          style: CustomTextStyles.lohit500style24,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              DescriptionsForm(
                doctor: doctor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
