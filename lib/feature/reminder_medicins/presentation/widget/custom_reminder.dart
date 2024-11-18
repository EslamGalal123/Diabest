// class CustomReminderMedicinForm extends StatelessWidget {
//   const CustomReminderMedicinForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: BlocBuilder<TaskCubit, TaskState>(
//         builder: (context, state) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //date now
//               Row(
//                 children: [
//                   Text(DateFormat.yMMMMd().format(DateTime.now()),
//                       style: Theme.of(context).textTheme.titleMedium),
//                   const Spacer(),
//                 ],
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               //Today
//               Text(AppStrings.today,
//                   style: Theme.of(context).textTheme.bodyMedium),
//               //date picker
//               DatePicker(
//                 DateTime.now(),
//                 initialSelectedDate: DateTime.now(),
//                 selectionColor: AppColors.primarycolor,
//                 selectedTextColor: AppColors.white,
//                 dateTextStyle: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: "poppins",
//                     color: AppColors.primarycolor),
//                 dayTextStyle: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "poppins",
//                     color: AppColors.primarycolor),
//                 monthTextStyle: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "poppins",
//                     color: AppColors.primarycolor),
//                 onDateChange: (date) {
//                   BlocProvider.of<TaskCubit>(context).getSelectedDate(date);
//                 },
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               //no tasks
//               BlocProvider.of<TaskCubit>(context).tasksList.isEmpty
//                   ? noTasksWidget(context)
//                   : Expanded(
//                       child: ListView.builder(
//                         itemCount: BlocProvider.of<TaskCubit>(context)
//                             .tasksList
//                             .length,
//                         itemBuilder: (context, index) {
//                           return TaskComponent(
//                             taskModel: BlocProvider.of<TaskCubit>(context)
//                                 .tasksList[index],
//                           );
//                         },
//                       ),
//                     ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Column noTasksWidget(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset(Assets.noTasks),
//         Text(AppStrings.noTaskTitle,
//             style: Theme.of(context).textTheme.bodyMedium),
//         Text(
//           AppStrings.noTaskSubTitle,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//       ],
//     );
//   }
// }

// class TaskComponent extends StatelessWidget {
//   const TaskComponent({
//     super.key,
//     required this.taskModel,
//   });
//   final ReminderModel taskModel;
//   Color getColor(index) {
//     switch (index) {
//       case 0:
//         return AppColors.red;
//       case 1:
//         return AppColors.green;
//       case 2:
//         return AppColors.blueGrey;
//       case 3:
//         return AppColors.blue;
//       case 4:
//         return AppColors.orange;
//       case 5:
//         return AppColors.purple;
//       default:
//         return AppColors.grey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (context) {
//             return Container(
//               padding: const EdgeInsets.all(24),
//               height: 240,
//               color: AppColors.deebGrey,
//               child: Column(
//                 children: [
//                   //taskCompleted
//                   SizedBox(
//                           height: 48,
//                           width: double.infinity,
//                           child: CustomButton(
//                             text: AppStrings.taskCompleted,
//                             onPressed: () {

//                             },
//                           ),
//                         ),
//                   const SizedBox(
//                     height: 24,
//                   ),

//                   //deleteTask
//                   SizedBox(
//                     height: 48,
//                     width: double.infinity,
//                     child: CustomButton(
//                       text: AppStrings.delete,
//                       backgroundColor: AppColors.red,
//                       onPressed: () {
//                         BlocProvider.of<TaskCubit>(context)
//                             .deleteTask(taskModel.id);
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 24,
//                   ),
//                   //cancel
//                   SizedBox(
//                     height: 48,
//                     width: double.infinity,
//                     child: CustomButton(
//                       text: AppStrings.cancel,
//                       onPressed: () {
//                        Navigator.pop(context);
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             );
//           },
//         );
//       },
//       child: Container(
//         height: 132,
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: getColor(taskModel.color),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         margin: const EdgeInsets.only(bottom: 16),
//         child: Row(
//           children: [
//             //column
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //title
//                   Text(
//                     taskModel.title,
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                   const SizedBox(height: 8),

//                   //row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Icon(
//                         Icons.timer,
//                         color: AppColors.white,
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         '${taskModel.startTime} - ${taskModel.endTime}',
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   //note
//                   Text(
//                     taskModel.note,
//                     style: Theme.of(context).textTheme.titleMedium,
//                   ),
//                 ],
//               ),
//             ),

//             //divider
//             Container(
//               height: 75,
//               width: 1,
//               color: Colors.white,
//               margin: const EdgeInsets.only(right: 10),
//             ),
//             // const SizedBox(width: 10,),
//             //text
//             RotatedBox(
//               quarterTurns: 3,
//               child: Text(
//                 taskModel.isCompleted == 1
//                     ? AppStrings.completed
//                     : AppStrings.reminder,
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//     return Column(
//       children: [
//         Row(
//           children: [
//             Image.asset(Assets.remindermedicin,width: 100,),
//             Text("Medicine",style:CustomTextStyles.lohit500style24deed ,)
//           ],
//         ),
//         Row(
//           children: [
//             Image.asset(Assets.start,width: 50,),
//             Text("Please Enter Medicine Name",style:Theme.of(context).textTheme.bodyMedium ,)
//           ],
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.20,
//           width: MediaQuery.of(context).size.width * 0.80,
//           padding:const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child:const Text(""),
//         ),
//          Row(
//           children: [
//             Image.asset(Assets.start,width: 50,),
//             Text("What is this medicine used for?",style:Theme.of(context).textTheme.bodyMedium ,)
//           ],
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.20,
//           width: MediaQuery.of(context).size.width * 0.80,
//           padding:const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child:const Text(""),
//         ),
//          Row(
//           children: [
//             Image.asset(Assets.start,width: 50,),
//             Text("How often do you take this \nmedicine?", style:Theme.of(context).textTheme.bodyMedium , maxLines: 2)
//           ],
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height * 0.20,
//           width: MediaQuery.of(context).size.width * 0.80,
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
// }
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/cubit/time_cubit.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/widget/custom_button.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/widget/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class mmkl extends StatelessWidget {
  const mmkl({super.key});

  @override
  Widget build(BuildContext context) {
    return Taskcomponent(
      name: "take1",
      time: '09:33 pm',
      title: "panadol",
    );
  }
}

// ignore: must_be_immutable
class Taskcomponent extends StatelessWidget {
  Taskcomponent(
      {super.key, required this.name, required this.time, required this.title});

  String title, name, time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 132,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: CustomTextStyles.lohit500style20,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.timer,
                      color: AppColors.white,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      time,
                      style: CustomTextStyles.lohit300style16
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: CustomTextStyles.lohit500style18
                      .copyWith(color: AppColors.black1),
                ),
              ],
            ),
          ),
          Container(
            height: 75,
            width: 1,
            color: Colors.white,
            margin: const EdgeInsets.only(right: 10),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              "Reminder",
              // , AppStrings.reminder,
              style: CustomTextStyles.lohit500style20,
            ),
          )
        ],
      ),
    );
  }
}

class ReminderMedicinsForm extends StatefulWidget {
  const ReminderMedicinsForm({super.key});

  @override
  State<ReminderMedicinsForm> createState() => _ReminderMedicinsFormState();
}

class _ReminderMedicinsFormState extends State<ReminderMedicinsForm> {
  // void initState() {
  //   super.initState();
  //   listenToNotificationStream();
  // }

  // void listenToNotificationStream() {
  //   LocalNotificationService.streamController.stream.listen(
  //     (notificationResponse) {
  //       log(notificationResponse.id!.toString() );
  //       log(notificationResponse.payload!.toString() );
  //       //logic to get product from database.
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (_) => NotificationDetailsScreen(
  //       //       response: notificationResponse,
  //       //     ),
  //       //   ),
  //       // );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //date now
        Row(
          children: [
            Text(DateFormat.yMMMMd().format(DateTime.now()),
                style: CustomTextStyles.lohit600style28
                    .copyWith(color: AppColors.black1)),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        //Today
        Text(AppStrings.today, style: CustomTextStyles.lohit500style22),
        //date picker
        DatePicker(height: 90,
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primarycolor,
          selectedTextColor: AppColors.white,
          dateTextStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: "poppins",
              color: AppColors.primarycolor),
          dayTextStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: "poppins",
              color: AppColors.primarycolor),
          monthTextStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              fontFamily: "poppins",
              color: AppColors.primarycolor),
          onDateChange: (date) {},
        ),
        const SizedBox(
          height: 24,
        ),
        //no tasks
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: const EdgeInsets.all(24),
                  height: 240,
                  color: AppColors.deebGrey,
                  child: Column(
                    children: [
                      //taskCompleted
                      // SizedBox(
                      //         height: 48,
                      //         width: double.infinity,
                      //         child: CustomButton(
                      //           text: AppStrings.taskCompleted,
                      //           onPressed: () {

                      //           },
                      //         ),
                      //       ),
                      const SizedBox(
                        height: 24,
                      ),

                      //deleteTask
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: CustomButton(
                          text: AppStrings.delete,
                          backgroundColor: AppColors.red,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //cancel
                      SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: CustomButton(
                          backgroundColor: AppColors.red,
                          text: AppStrings.cancel,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: SingleChildScrollView(
            child: BlocBuilder<TimeCubit, TimeState>(
              builder: (context, stateOfTime) {
                List reminderAddedList = [];
                if (stateOfTime is SuccessShowTimerPicker){
                  reminderAddedList = stateOfTime.reminderAddedList;
                }
                return Column(
                  children: [
                    ListView.builder(
                        itemCount: reminderAddedList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Taskcomponent(
                            title: reminderAddedList![index]["title"],
                            time: reminderAddedList![index]["time"],
                            name: reminderAddedList![index]["description"],
                          );
                        })

                  ],
                );
              },
            ),
          ),
        ),

//          ElevatedButton(onPressed: (){
// LocalNotificationService.showRepeatedNotification();

//          },style:  ElevatedButton.styleFrom(backgroundColor: Colors.white), child: const Text("")
//          ,),
        const SizedBox(
          height: 20,
        ),
        // GestureDetector(
        //   onTap: () {
        //     LocalNotificationService.showBasicNotification();
        //   },
        //   child: const SizedBox(
        //     height: 50,
        //     width: 100,
        //     child: Text(""),
        //   ),
        // ),
        // ListTile(
        //     onTap: () {
        //       LocalNotificationService.showBasicNotification();
        //     },
        //     leading: const Icon(Icons.notifications),
        //     title: const Text('Basic Notification'),
        //     subtitle: const Text('with custom sound'),
        //     trailing: IconButton(
        //       onPressed: () {
        //         // LocalNotificationService.cancelNotification(0);
        //       },
        //       icon: const Icon(
        //         Icons.cancel,
        //         color: Colors.red,
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
