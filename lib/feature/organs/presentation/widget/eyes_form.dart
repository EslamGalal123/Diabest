// import 'dart:io';


// import 'package:diiabest/core/Utils/App-Assets.dart';
// import 'package:diiabest/core/Utils/App-String.dart';
// import 'package:diiabest/core/Utils/App-TextStyles.dart';
// import 'package:diiabest/core/Utils/App-colors.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// class EyesForm extends StatefulWidget {
//   const EyesForm({super.key});

//   @override
//   State<EyesForm> createState() => _EyesFormState();
// }

// class _EyesFormState extends State<EyesForm> {
//   File? selectImage;
//   bool isFile = false;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image.asset(Assets.imagesImageEyes),
//         const SizedBox(
//           height: 15,
//         ),
//          Text(
//           "Take a picture of your eyes here",
//           style: CustomTextStyles.lohit500style24,
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         GestureDetector(
//           onTap: () {
//             showDialog(
//                 context: context,
//                 builder: (context) {
//                   return SimpleDialog(
//                     children: [
//                       TextButton(
//                           onPressed: pickImageFromCamera,
//                           child: const Text(AppStrings.camara)),
//                       TextButton(
//                           onPressed: pickImageFromGallery,
//                           child: const Text(AppStrings.gallery)),
//                     ],
//                   );
//                 });
//           },
//           child: DottedBorder(
//             color: AppColors.grey,
//             strokeWidth: 2.0,
//             dashPattern: const [5, 5],
//             borderType: BorderType.RRect,
//             radius: const Radius.circular(8.0),
//             child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.95,
//                 height: MediaQuery.of(context).size.height * 0.20,
//                 child: isFile
//                     ? Image.file(
//                         selectImage!,
//                         fit: BoxFit.cover,
//                       )
//                     : Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.camera_alt,
//                             size: 30,
//                             color: Color(0xff0095FF),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.only(top: 15),
//                             child: Text('Pick Image Here',
//                                 style: CustomTextStyles.lohit500style18
//                                     .copyWith(color: AppColors.deebGrey)),
//                           ),
//                         ],
//                       )),
//           ),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//        Text(
//           "Prevention:",
//           style: CustomTextStyles.lohit500style24,
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.20,
//           width: MediaQuery.of(context).size.width * 0.90,
//           padding:const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child:const Text(""),
//         ),
//       ],
//     );
//   }

//   Future pickImageFromCamera() async {
//     XFile? xFileImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     File image = File(xFileImage!.path);
//     Navigator.of(context).pop();
//     setState(() {
//       selectImage = image;
//       isFile = true;
//     });
//   }

//   Future pickImageFromGallery() async {
//     XFile? xFileImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     File image = File(xFileImage!.path);
//     Navigator.of(context).pop();
//     setState(() {
//       selectImage = image;
//       isFile = true;
//     });
//   }
// }
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EyesForm extends StatefulWidget {
  const EyesForm({Key? key}) : super(key: key);

  @override
  State<EyesForm> createState() => _EyesFormState();
}

class _EyesFormState extends State<EyesForm> {
  File? selectImage;
  bool isFile = false;
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('Assets/Images/plan.png'),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Take a picture of your eyes here",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    children: [
                      TextButton(
                        onPressed: pickImageFromCamera,
                        child: const Text("Camera"),
                      ),
                      TextButton(
                        onPressed: pickImageFromGallery,
                        child: const Text("Gallery"),
                      ),
                    ],
                  );
                },
              );
            },
            child: DottedBorder(
              color: Colors.grey,
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
                            child: Text(
                              'Pick Image Here',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Prevention:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: BoxConstraints(
              minHeight: 100,
              maxHeight: MediaQuery.of(context).size.height * 0.20,
            ),
            width: MediaQuery.of(context).size.width * 0.90,
            child: SingleChildScrollView(
              child: Text(
                resultText,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Future pickImageFromCamera() async {
    XFile? xFileImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (xFileImage == null) return;

    File image = File(xFileImage.path);

    // Call function to process image and get result
    String? result = await processImageAndGetResult(image);

    setState(() {
      selectImage = image;
      isFile = true;
      resultText = result ?? "Failed to get result"; // Handle null case
    });
  }

  Future pickImageFromGallery() async {
    XFile? xFileImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFileImage == null) return;

    File image = File(xFileImage.path);

    // Call function to process image and get result
    String? result = await processImageAndGetResult(image);

    setState(() {
      selectImage = image;
      isFile = true;
      resultText = result ?? "Failed to get result"; // Handle null case
    });
  }

  Future<String?> processImageAndGetResult(File image) async {
    final apiUrl = Uri.parse('https://dfumodel.onrender.com/dfu');

    try {
      // Example using http package to post image to API
      var request = http.MultipartRequest('POST', apiUrl);
      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var parsedJson = jsonDecode(responseData);

        // Assuming API returns result in 'predicted_class' field
        String predictedClass = parsedJson['predicted_class'];
        Map<String, dynamic> classProbabilities = parsedJson['class_probabilities'];

        // Customize result text based on predicted class
        String resultText = "";
        if (predictedClass == "Wound") {
          resultText = "Predicted class: Wound\n";
          resultText += "Probability: ${classProbabilities['Wound']}\n";
          resultText += "Prevention for wound: ...\n"; // Replace with your prevention text for wound
        } else if (predictedClass == "DFU") {
          resultText = "Predicted class: DFU\n";
          resultText += "Probability: ${classProbabilities['DFU']}\n";
          resultText += "Prevention for DFU: ...\n"; // Replace with your prevention text for DFU
        } else {
          resultText = "Unknown prediction"; // Handle unexpected case
        }

        return resultText;
      } else {
        print('Error uploading image: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error sending image to API: $e');
      return null;
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Eyes Form'),
      ),
      body: EyesForm(),
    ),
  ));
}
