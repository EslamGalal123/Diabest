
import 'package:diiabest/core/Utils/App-Assets.dart';

class DoctorModel {
  final String imagePath;
  final String title;
  

  DoctorModel({
    required this.imagePath,
    required this.title,
    
  });
}

List<DoctorModel> onBoardingData = [
  DoctorModel(
    imagePath: Assets.imagesImageInternist,
    title: 'Welcome To Diabetes Application',
  ),
  DoctorModel(
    imagePath: Assets.imagesImageInternist,
    title: 'With you in different places',
  ),
  DoctorModel(
    imagePath: Assets.imagesImageInternist,
    title: 'Let''s join the application'
  ),];