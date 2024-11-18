import 'dart:io';
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({Key? key}) : super(key: key);

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  File? selectImage;
  bool isFile = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 0.44.sw,
            height: 0.21.sh,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.grey,
                width: 2.0,
              ),
            ),
            child: ClipOval(
              child: isFile
                  ? Image.file(
                      selectImage!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      Assets.imagesImageProfilDoctor,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      children: [
                        TextButton(
                          onPressed: pickImageFromCamera,
                          child: const Text(AppStrings.camara),
                        ),
                        TextButton(
                          onPressed: pickImageFromGallery,
                          child: const Text(AppStrings.gallery),
                        ),
                        TextButton(
                          onPressed: cancel,
                          child: const Text(AppStrings.cancel),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }

  Future pickImageFromCamera() async {
    XFile? xFileImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    File image = File(xFileImage!.path);
    Navigator.of(context).pop();
    BlocProvider.of<ProfileCubit>(context).userImage = image;
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
    BlocProvider.of<ProfileCubit>(context).userImage = image;
    setState(() {
      selectImage = image;
      isFile = true;
    });
  }

  void cancel() {
    Navigator.of(context).pop();
  }
}
