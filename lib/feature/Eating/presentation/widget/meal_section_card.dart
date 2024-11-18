import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/Eating/presentation/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealSectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Map<String, String>> items;
  final String image;

  const MealSectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
        return Card(
          child: ListTile(
            leading: Icon(icon, size: 50.sp), // Using ScreenUtil for icon size
            title: Text(
              title,
              style: CustomTextStyles.lohit500style20,
            ),
            subtitle: Text(
              '${items.length} items',
              style: CustomTextStyles.lohit400style18,
            ),
            trailing: Image.asset(
              image,
              width: 100.w, // Using ScreenUtil for image width
              height: 100.h, // Using ScreenUtil for image height
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(title: title, items: items, image: image),
                ),
              );
            },
          ),
    );
  }
}
