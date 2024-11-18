// import 'package:diiabest/core/Utils/App-Assets.dart';
// import 'package:flutter/material.dart';

// class ContactUsView extends StatelessWidget {
//   const ContactUsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         //backgroundColor: Colors.blueGrey,
//         appBar: AppBar(
//           elevation: 0,
//           title:const Text(
//             "Contact Us",
//             style: TextStyle(color: Color(0xff3fb2f4),fontSize: 25),
//           ),
//           backgroundColor: Colors.white,
//         ),
//         body: ListView(
//           children: [
//            const SizedBox(
//               height: 50,
//             ),
//             Center(
//                 child:Image.asset(Assets.contat,
//                 height: 300,)),
//           const  SizedBox(
//               height: 10,
//             ),
//             Text(
//               'If you need help \n feel free to contact us.',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey[800],
//                 fontSize: 20,
//               ),
//             ),
//          const   SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration:const BoxDecoration(color: Colors.white, boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 20,
//                       )
//                     ]),
//                     height: 110,
//                     width: 160,

//                     //color: Colors.white,
//                     child:const Column(
//                       children: [
//                         Icon(
//                           Icons.alternate_email,
//                           color: Color(0xff3fb2f4),
//                           size: 50,
//                         ),
//                         Text('Write to us'),
//                         Text(
//                           'diabest@gmail.com',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration:const BoxDecoration(color: Colors.white, boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 20,
//                       )
//                     ]),
//                     height: 110,
//                     width: 160,
//                     // color: Colors.white,
//                     child:const Column(
//                       children: [
//                         Icon(
//                           Icons.help,
//                           color: Color(0xff3fb2f4),
//                           size: 50,
//                         ),
//                         Text('FAQs'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration:const BoxDecoration(color: Colors.white, boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 20,
//                       )
//                     ]),
//                     height: 110,
//                     width: 160,
//                     // color: Colors.white,
//                     child:const Column(
//                       children: [
//                         Icon(
//                           Icons.phone,
//                           color: Color(0xff3fb2f4),
//                           size: 50,
//                         ),
//                         Text('01015290522'),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 110,
//                     width: 160,
//                     decoration:const BoxDecoration(color: Colors.white, boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 20,
//                       )
//                     ]),
//                     //color: Colors.white,
//                     child:const Column(
//                       children: [
//                         Icon(
//                           Icons.home,
//                           color: Color(0xff3fb2f4),
//                           size: 50,
//                         ),
//                         Text('DIABEST'),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//   }
// }

import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:diiabest/core/Utils/App-Assets.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    // تأكد من تهيئة ScreenUtil في بداية تطبيقك، عادة في ملف main.dart
    return ScreenUtilInit(
      designSize: const Size(360, 690),  // حجم التصميم الأساسي (يمكنك تغييره بناءً على تصميمك)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: ListView(
            children: [
                 SizedBox(height: 10.h,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                                'Contact Us',
                                style: CustomTextStyles.lohit500style20,
                                textAlign: TextAlign.left,
                              ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,  // استخدم h للوحدات الرأسية
              ),
              Center(
                child: Image.asset(
                  Assets.contat,
                  height: 300.h,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'If you need help \n feel free to contact us.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.sp,  // استخدم sp للوحدات النصية
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContactOption(
                    icon: Icons.alternate_email,
                    text1: 'Write to us',
                    text2: 'diabest@gmail.com',
                  ),
                  _buildContactOption(
                    icon: Icons.help,
                    text1: 'FAQs',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContactOption(
                    icon: Icons.phone,
                    text1: '01015290522',
                  ),
                  _buildContactOption(
                    icon: Icons.home,
                    text1: 'DIABEST',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String text1,
    String? text2,
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),  // استخدم w للوحدات الأفقية
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
            )
          ],
        ),
        height: 120.h,
        width: 160.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xff3fb2f4),
              size: 50.sp,
            ),
            Text(
              text1,
              style: TextStyle(fontSize: 16.sp),
            ),
            if (text2 != null)
              Text(
                text2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp),
              ),
          ],
        ),
      ),
    );
  }
}
