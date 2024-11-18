import 'package:diiabest/core/services/url_lancher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSocialIcons extends StatelessWidget {
  const CustomSocialIcons({super.key, required this.image, required this.url});
  final String image;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch(url: url);
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(5.w),
        width: 50.w,
        height: 50.w,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: Colors.black),
            borderRadius: BorderRadius.circular(50.w),
          ),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
