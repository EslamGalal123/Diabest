import 'dart:io';

import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImagePickervView extends StatefulWidget {
  const ImagePickervView({Key? key}) : super(key: key);

  @override
  State<ImagePickervView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ImagePickervView> {
  File? selectImage;
  bool isFile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(alignment: Alignment.topCenter, children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.44,
          height: MediaQuery.of(context).size.height * 0.21,
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
                                child: const Text(AppStrings.camara)),
                            TextButton(
                                onPressed: pickImageFromGallery,
                                child: const Text(AppStrings.gallery)),
                            TextButton(
                                onPressed: cancel,
                                child: const Text(AppStrings.cancel)),
                          ],
                        );
                      });
                },
                child: const Icon(Icons.camera_alt)))
      ]),
    ));
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

  void cancel() {
    Navigator.of(context).pop();
  }
}
// ignore: must_be_immutable


