import 'dart:convert';
import 'dart:io';
import 'package:diiabest/core/Utils/App-Assets.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class HeartForm extends StatefulWidget {
  const HeartForm({super.key});

  @override
  State<HeartForm> createState() => _HeartFormState();
}

class _HeartFormState extends State<HeartForm> {
  File? selectImage;
  bool isFile = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("Assets/Images/ImageFoots.png"),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Take a picture of your heart here",
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

class FootView extends StatefulWidget {
  @override
  _FootViewState createState() => _FootViewState();
}

class _FootViewState extends State<FootView> {
  String? predictedClass;
  bool isLoading = false;

  Future<void> uploadImage(ImageSource source) async {
    setState(() {
      isLoading = true;
    });

    final XFile? imageFile = await ImagePicker().pickImage(source: source);
    if (imageFile == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final File file = File(imageFile.path);
    if (!file.existsSync()) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final String apiUrl = 'https://dfumodel.onrender.com/dfu';

    final uri = Uri.parse(apiUrl);
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath(
      'file',
      file.path,
      contentType: MediaType('image', 'jpeg'),
    ));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> responseData = jsonDecode(responseBody);

      if (responseData.containsKey('predicted_class')) {
        final String predictedClass = responseData['predicted_class'];

        setState(() {
          this.predictedClass = predictedClass;
          isLoading = false;
        });
      } else {
        setState(() {
          predictedClass = "Unknown";
          isLoading = false;
        });
      }
    } else {
      setState(() {
        predictedClass = null;
        isLoading = false;
      });
    }
  }

  void showImagePickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Picture'),
                onTap: () {
                  Navigator.of(context).pop();
                  uploadImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Upload from Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  uploadImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: isLoading ? null : showImagePickerDialog,
              child: Text('Select Image'),
            ),
            SizedBox(height: 16.0),
            if (isLoading)
              CircularProgressIndicator()
            else if (predictedClass != null)
              Column(
                children: [
                  Text(
                    'Predicted Class: $predictedClass',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    predictedClass == 'Wound' ? 'This is a minor wound' : 'This dfu should visit the patient',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              )
            else
              Text(
                'No image uploaded',
                style: TextStyle(fontSize: 18.0),
              ),
          ],
        ),
      ),
    );
  }
}
