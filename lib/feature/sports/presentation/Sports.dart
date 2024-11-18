import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sport {
  final String name;
  final String category;
  final String benefits;
  final IconData icon;

  Sport({
    required this.name,
    required this.category,
    required this.benefits,
    required this.icon,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _heartCondition = false;
  bool _diabetes = false;
  List<Sport> _recommendedSports = [];

  double calculateBmi(double weight, double height) {
    return weight / ((height / 100) * (height / 100));
  }

  void suggestSports(double bmi, bool heartCondition, bool diabetes) {
    if (heartCondition && diabetes) {
      _recommendedSports = [
        Sport(
            name: "Walking",
            category: "Low-Impact Exercise",
            benefits:
                "Improves cardiovascular health and helps manage blood sugar levels.",
            icon: Icons.directions_walk),
        Sport(
            name: "Swimming",
            category: "Low-Impact Exercise",
            benefits:
                "Strengthens muscles and improves cardiovascular health without straining the heart.",
            icon: Icons.pool),
        Sport(
            name: "Yoga",
            category: "Mind-Body Exercise",
            benefits:
                "Reduces stress, improves flexibility, and may improve insulin sensitivity.",
            icon: Icons.self_improvement),
      ];
    } else if (heartCondition) {
      _recommendedSports = [
        Sport(
            name: "Walking",
            category: "Low-Impact Exercise",
            benefits: "Improves cardiovascular health with low risk of strain.",
            icon: Icons.directions_walk),
        Sport(
            name: "Swimming",
            category: "Low-Impact Exercise",
            benefits:
                "Improves cardiovascular health without stressing the heart.",
            icon: Icons.pool),
        Sport(
            name: "Cycling",
            category: "Low-Impact Exercise",
            benefits:
                "Strengthens leg muscles and improves cardiovascular health.",
            icon: Icons.directions_bike),
      ];
    } else if (diabetes) {
      _recommendedSports = [
        Sport(
            name: "Walking",
            category: "Low-Impact Exercise",
            benefits:
                "Improves insulin sensitivity and helps manage blood sugar levels.",
            icon: Icons.directions_walk),
        Sport(
            name: "Swimming",
            category: "Low-Impact Exercise",
            benefits:
                "Helps control blood sugar levels and improves overall fitness.",
            icon: Icons.pool),
        Sport(
            name: "Yoga",
            category: "Mind-Body Exercise",
            benefits: "Reduces stress and may improve insulin sensitivity.",
            icon: Icons.self_improvement),
      ];
    } else {
      if (bmi < 18.5) {
        _recommendedSports = [
          Sport(
              name: "Swimming",
              category: "Water Sport",
              benefits: "Improves cardiovascular health and muscle strength.",
              icon: Icons.pool),
          Sport(
              name: "Gymnastics",
              category: "Indoor Sport",
              benefits: "Enhances flexibility and core strength.",
              icon: Icons.accessibility_new),
          Sport(
              name: "Cycling",
              category: "Outdoor Sport",
              benefits: "Builds leg muscles and improves joint mobility.",
              icon: Icons.directions_bike),
          Sport(
              name: "Rowing",
              category: "Water Sport",
              benefits:
                  "Strengthens back and arms while providing a full-body workout.",
              icon: Icons.rowing),
          Sport(
              name: "Dancing",
              category: "Indoor/Outdoor Sport",
              benefits:
                  "Improves coordination, flexibility, and cardiovascular health.",
              icon: Icons.music_note),
        ];
      } else if (bmi < 25) {
        _recommendedSports = [
          Sport(
              name: "Running",
              category: "Outdoor Sport",
              benefits: "Improves cardiovascular endurance and burns calories.",
              icon: Icons.directions_run),
          Sport(
              name: "Yoga",
              category: "Indoor Sport",
              benefits:
                  "Increases flexibility, strength, and mental well-being.",
              icon: Icons.self_improvement),
          Sport(
              name: "Football",
              category: "Team Sport",
              benefits: "Enhances cardiovascular fitness and teamwork skills.",
              icon: Icons.sports_soccer),
          Sport(
              name: "Tennis",
              category: "Racquet Sport",
              benefits:
                  "Improves agility, coordination, and cardiovascular health.",
              icon: Icons.sports_tennis),
          Sport(
              name: "Hiking",
              category: "Outdoor Sport",
              benefits:
                  "Strengthens muscles and improves cardiovascular health.",
              icon: Icons.terrain),
        ];
      } else {
        _recommendedSports = [
          Sport(
              name: "Weightlifting",
              category: "Gym Sport",
              benefits: "Builds muscle mass and increases metabolism.",
              icon: Icons.fitness_center),
          Sport(
              name: "Boxing",
              category: "Combat Sport",
              benefits:
                  "Improves agility, coordination, and upper body strength.",
              icon: Icons.sports_mma),
          Sport(
              name: "Basketball",
              category: "Team Sport",
              benefits:
                  "Enhances agility, endurance, and cardiovascular health.",
              icon: Icons.sports_basketball),
          Sport(
              name: "Rock Climbing",
              category: "Outdoor Sport",
              benefits:
                  "Strengthens muscles, improves flexibility, and mental focus.",
              icon: Icons.terrain),
          Sport(
              name: "Soccer",
              category: "Team Sport",
              benefits:
                  "Enhances cardiovascular endurance and builds leg strength.",
              icon: Icons.sports_soccer),
        ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sport Recommendations', style: CustomTextStyles.lohit500style20),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                    child: Column(
                      children: [
                        Text(
                          'Enter Your Information',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        TextFormField(
                          controller: _weightController,
                          decoration: InputDecoration(
                            labelText: 'Weight (kg)',
                            labelStyle: CustomTextStyles.lohit400style18,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                            ),
                            prefixIcon: Icon(Icons.line_weight),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        TextFormField(
                          controller: _heightController,
                          decoration: InputDecoration(
                            labelText: 'Height (cm)',
                            labelStyle: CustomTextStyles.lohit400style18,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10)),
                            ),
                            prefixIcon: Icon(Icons.height),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your height';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        CheckboxListTile(
                          title: Text('Heart Condition',style: CustomTextStyles.lohit400style18.copyWith(color: AppColors.black1)),
                          value: _heartCondition,
                          onChanged: (value) {
                            setState(() {
                              _heartCondition = value!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        CheckboxListTile(
                          title: Text('Diabetes',style: CustomTextStyles.lohit400style18.copyWith(color: AppColors.black1)),
                          value: _diabetes,
                          onChanged: (value) {
                            setState(() {
                              _diabetes = value!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              double weight =
                                  double.parse(_weightController.text);
                              double height =
                                  double.parse(_heightController.text);
                              double bmi = calculateBmi(weight, height);
                              suggestSports(bmi, _heartCondition, _diabetes);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecommendationScreen(recommendedSports: _recommendedSports),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30), vertical: ScreenUtil().setWidth(15)),
                            backgroundColor: AppColors.primarycolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25)),
                            ),
                          ),
                          child: Text(
                            'Get Recommendations',
                            style: CustomTextStyles.lohit500style24.copyWith(fontSize: ScreenUtil().setSp(20), color: AppColors.offwhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecommendationScreen extends StatelessWidget {
  final List<Sport> recommendedSports;

  RecommendationScreen({required this.recommendedSports});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Sports', style: CustomTextStyles.lohit500style22),
      ),
      body: ListView.builder(
        itemCount: recommendedSports.length,
        itemBuilder: (context, index) {
          final sport = recommendedSports[index];
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            margin: EdgeInsets.all(ScreenUtil().setWidth(8)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: ScreenUtil().setWidth(5),
                  blurRadius: ScreenUtil().setWidth(7),
                  offset: Offset(0, ScreenUtil().setWidth(3)),
                ),
              ],
              color: Color(0xfff4f4f4),
            ),
            child: ListTile(
              leading: Icon(sport.icon, size: ScreenUtil().setWidth(40)),
              title: Text(
                sport.name,
                style: TextStyle(
                  color: Color(0xff86beec),
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
              subtitle: Text(
                '${sport.category}\n${sport.benefits}',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
