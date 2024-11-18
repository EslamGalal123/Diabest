import 'package:diiabest/feature/doctor/presentation/widgets/image_of_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileDoctorForm extends StatelessWidget {
  const EditProfileDoctorForm({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // تصميمك الأساسي للشاشة
    );

    return Column(
      children: [
        SizedBox(
          height: 0.25.sh,
          child: const ImagePickerView(),
        ),
      ],
    );
  }
}
