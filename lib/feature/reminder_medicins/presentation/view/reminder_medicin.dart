import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/view/reminder_details.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/widget/custom_reminder.dart';
import 'package:flutter/material.dart';
class ReminderMedicinsView extends StatelessWidget {
  const ReminderMedicinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  TimeScreen()));
          },
          backgroundColor: AppColors.primarycolor,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.offwhite,
          title:  Text(
            "Reminder",
            style: CustomTextStyles.lohit500style24,
          ),
        ),
        body:
            // ScreenUtilInit(
            //   designSize: const Size(375, 812),
            //   builder: (context, child) {
            //     return BlocBuilder<TaskCubit, TaskState>(
            //       builder: (context, state) {
            //         return
            const SafeArea(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(child: ReminderMedicinsForm()),
                        ]))));
  }
}
