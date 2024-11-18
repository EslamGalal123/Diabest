import 'dart:io';
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TeethForm extends StatefulWidget {
  const TeethForm({super.key});

  @override
  State<TeethForm> createState() => _TeethFormState();
}

class _TeethFormState extends State<TeethForm> {
  File? selectImage;
  bool isFile = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.imagesImageteeth),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Take a picture of your teeth here",
          style: CustomTextStyles.lohit500style24,
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    children: [
                      TextButton(
                          onPressed: pickImageFromCamera,
                          child: const Text(AppStrings.camara)),
                      TextButton(
                          onPressed: pickImageFromGallery,
                          child: const Text(AppStrings.gallery)),
                    ],
                  );
                });
          },
          child: DottedBorder(
            color: AppColors.grey,
            strokeWidth: 2.0,
            dashPattern: const [5, 5],
            borderType: BorderType.RRect,
            radius: const Radius.circular(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.20,
                child: isFile
                    ? Image.file(
                        selectImage!,
                        fit: BoxFit.cover,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Color(0xff0095FF),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text('Pick Image Here',
                                style: CustomTextStyles.lohit500style18
                                    .copyWith(color: AppColors.deebGrey)),
                          ),
                        ],
                      )),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      Text(
          "Prevention:",
          style: CustomTextStyles.lohit500style24,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: MediaQuery.of(context).size.width * 0.90,
          padding:const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child:const Text(""),
        ),
      ],
    );
  }

  Future pickImageFromCamera() async {
    XFile? xFileImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    File image = File(xFileImage!.path);
    Navigator.of(context).pop();
    setState(() {
      selectImage = image;
      isFile = true;
    });
  }

  Future pickImageFromGallery() async {
    XFile? xFileImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    File image = File(xFileImage!.path);
    Navigator.of(context).pop();
    setState(() {
      selectImage = image;
      isFile = true;
    });
  }
}
