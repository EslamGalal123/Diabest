import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  final String image;

  const DetailsPage({
    super.key, 
    required this.title,
    required this.items,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title, style: CustomTextStyles.lohit500style22.copyWith(fontSize: 22.sp)),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                Image.asset(image, height: 200.h, width: double.infinity, fit: BoxFit.cover),
                SizedBox(height: 20.h),
                Text(title, style: CustomTextStyles.lohit500style22.copyWith(fontSize: 22.sp)),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        title: Text(item['name']!, style: CustomTextStyles.lohit500style20.copyWith(fontSize: 20.sp)),
                        subtitle: Text('${item['category']} - ${item['serve']}', style: CustomTextStyles.lohit400style18.copyWith(fontSize: 18.sp)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        
    );
  }
}
