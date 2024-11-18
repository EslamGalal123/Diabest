import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTileInHome extends StatelessWidget {
  final String titlehome;
  final String subtitlehome;
  final String leadinghome;
  final VoidCallback onpressed;

  CustomListTileInHome({
    Key? key,
    required this.titlehome,
    required this.subtitlehome,
    required this.leadinghome,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10.w), // Using width proportionate padding
        height: 0.11.sh, // Using height proportionate to screen height
        decoration: BoxDecoration(
          color: const Color(0xFFF3EEEE),
          borderRadius: BorderRadius.circular(20.w), // Using width proportionate border radius
        ),
        child: ListTile(
          title: Text(
            titlehome,
            style: CustomTextStyles.lohit500style22.copyWith(
              fontSize: 21.sp, // Using font size proportionate to screen width
            ),
          ),
          subtitle: Row(
            children: [
              const Icon(
                Icons.star,
                size: 15,
                color: Colors.blue,
              ),
              SizedBox(width: 5.w), // Using width proportionate spacing
              Text(
                subtitlehome,
                style: CustomTextStyles.lohit300style16,
              ),
            ],
          ),
          leading: Image.asset(
            leadinghome,
            width: 40.w,
            height: 40.h,
          ),
        ),
      ),
    );
  }
}
