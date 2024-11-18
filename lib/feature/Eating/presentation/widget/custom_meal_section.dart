
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/feature/Eating/presentation/widget/meal_section_card.dart';
import 'package:flutter/material.dart';
class MealSectionPage extends StatelessWidget {
  final int? calories;
  MealSectionPage({super.key, this.calories});

  final List<Map<String, dynamic>> mealData = [
    {
      'title': 'Breakfast',
      'icon': Icons.breakfast_dining,
      'items': [
        {'name': 'Oat', 'category': 'Whole Grains', 'serve': '1 cup'},
        {'name': 'Cherries', 'category': 'Fruit', 'serve': '1 cup'},
        {'name': 'Pineapple', 'category': 'Fruit', 'serve': '1 cup'},
        {'name': 'Granola', 'category': 'Whole Grains', 'serve': '1/2 cup'},
        {'name': 'Turkey bacon', 'category': 'Protein', 'serve': '3 slices'},
      ],
      'image': 'Assets/Images/BreakfastN.jpeg'
    },
    {
      'title': 'Lunch',
      'icon': Icons.lunch_dining,
      'items': [
        {'name': 'Meat', 'category': 'Protein', 'serve': '4 oz'},
        {'name': 'Rice', 'category': 'Carbs', 'serve': '1 cup'},
        {'name': 'Avocado', 'category': 'Fat', 'serve': '1/2'},
        {'name': 'Carrots', 'category': 'Vegetables', 'serve': '1 cup'},
        {'name': 'Potato', 'category': 'Vegetables', 'serve': '1 medium'},
      ],
      'image': 'Assets/Images/LunchN.jpeg'
    },
    {
      'title': 'Dinner',
      'icon': Icons.dinner_dining,
      'items': [
        {'name': 'Eggs', 'category': 'Protein', 'serve': '2 large'},
        {'name': 'Olive oil', 'category': 'Fat', 'serve': '1 tbsp'},
        {'name': 'Broccoli', 'category': 'Vegetables', 'serve': '1 cup'},
        {'name': 'Cauliflower', 'category': 'Vegetables', 'serve': '1 cup'},
      ],
      'image': 'Assets/Images/DinnerN.jpeg'
    },
    {
      'title': 'Snacks',
      'icon': Icons.fastfood,
      'items': [
        {'name': 'Apple', 'category': 'Fruit', 'serve': '1 medium'},
        {'name': 'Bananas', 'category': 'Fruit', 'serve': '1 medium'},
        {'name': 'Pumpkin seeds', 'category': 'Nuts', 'serve': '1/4 cup'},
        {'name': 'Celery sticks', 'category': 'Vegetables', 'serve': '1 cup'},
      ],
      'image': 'Assets/Images/SnacksN.jpeg'
    },
    {
      'title': 'Desserts',
      'icon': Icons.cake,
      'items': [
        {'name': 'Fruit salad', 'category': 'Fruit', 'serve': '1 cup'},
        {'name': 'Dark chocolate', 'category': 'Dessert', 'serve': '2 squares'},
      ],
      'image': 'Assets/Images/DessertsN.jpeg'
    },
    {
      'title': 'Drinks',
      'icon': Icons.local_cafe,
      'items': [
        {'name': 'Water', 'category': 'Beverage', 'serve': '1 cup'},
        {'name': 'Herbal tea', 'category': 'Beverage', 'serve': '1 cup'},
      ],
      'image': 'Assets/Images/DrinksN.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Sections for Diabetes',style: CustomTextStyles.lohit500style22),
      ),
      body: ListView(
        children: mealData.map((meal) {
          return MealSectionCard(
            title: meal['title'],
            icon: meal['icon'],
            items: meal['items'],
            image: meal['image'],
          );
        }).toList(),
      ),
    );
  }
}
