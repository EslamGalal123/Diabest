
import 'package:diiabest/core/Utils/App-Assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String subTitle;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    imagePath: Assets.imagesImageOnBoarding1,
    title: 'Welcome To Diabetes Application',
    subTitle:
         "This application helps you measure blood sugar using infrared",
  ),
  OnBoardingModel(
    imagePath: Assets.imagesImageOnBoarding2,
    title: 'With you in different places',
    subTitle: "he application helps you in all places when you face a crisis",
  ),
  OnBoardingModel(
    imagePath: Assets.imagesImageOnBoarding1,
    title: 'Let''s join the application',
    subTitle:
        "Welcome to the application, join us",
  ),
];