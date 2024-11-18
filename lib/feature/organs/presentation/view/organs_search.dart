import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/organs/presentation/widget/eyes_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/foot_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/heart_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/skin_view.dart';
import 'package:diiabest/feature/organs/presentation/widget/teeth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrgansView extends StatefulWidget {
  const OrgansView({super.key});

  @override
  State<OrgansView> createState() => _OrgansViewState();
}

class _OrgansViewState extends State<OrgansView> {
  static String searchQuery = '';
  List<Map<String, dynamic>> getFilteredItems() {
    return [
       {'title': 'Foot', 'value': 3, 'page': FootView()},
      {'title': 'Teeth', 'value': 1, 'page': TeethView()},
      {'title': 'Skin', 'value': 2, 'page':  SkinView()},
     
      {'title': 'Eyes', 'value': 6, 'page':  EyesView()},
    ].where((item) {
      final title = item['title'] as String;
      return title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  int? organ;

  void navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = getFilteredItems();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text(
                "Select the affected Organ",
                style: CustomTextStyles.lohit500style20.copyWith(
            fontSize: 20.sp, // Utilize screen util for font size
          ),
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: CustomTextStyles.lohit400style18,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              Column(
                children: filteredItems.map((item) {
                  return RadioListTile(
                    title: Text(
                      item['title'] as String,
                      style: CustomTextStyles.lohit500style18,
                    ),
                    value: item['value'],
                    groupValue: organ,
                    onChanged: (value) {
                      setState(() {
                        organ = value as int?;
                        navigateToPage(item['page'] as Widget);
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
