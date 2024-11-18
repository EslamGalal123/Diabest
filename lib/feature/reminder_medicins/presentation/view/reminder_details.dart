

import 'package:diiabest/core/Utils/App-String.dart';
import 'package:diiabest/core/Utils/App-TextStyles.dart';
import 'package:diiabest/core/Utils/App-colors.dart';
import 'package:diiabest/core/Widgets/custom_btn.dart';
import 'package:diiabest/feature/reminder_medicins/data/add_task_component.dart';
import 'package:diiabest/feature/reminder_medicins/data/function/local_notification_service.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/cubit/calender_cubit.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/cubit/time_cubit.dart';
import 'package:diiabest/feature/reminder_medicins/presentation/view/reminder_medicin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// class ReminderDetails extends StatelessWidget {
//   const ReminderDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0.0,
//         centerTitle: false,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios_new_outlined)),
//         title: Text(
//           AppStrings.addareminder,
//           style: Theme.of(context).textTheme.bodySmall,
//         ),
//       ),
//       body:  Padding(
//           padding: const EdgeInsets.all(24),
//           child: BlocConsumer<TaskCubit, TaskState>(
//             listener: (context, state) {
//               if (state is InsertTaskSucessState) {
//                 showToast(
//                     message: 'Added Sucessfully', state: ToastStates.success);
//                 Navigator.pop(context);
//               }
//             },
//             builder: (context, state) {
//               final cubit = BlocProvider.of<TaskCubit>(context);
//               return Form(
//                 key: BlocProvider.of<TaskCubit>(context).formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //! Title
//                     AddReminderComponent(
//                       controller:
//                           BlocProvider.of<TaskCubit>(context).titleController,
//                       tilte: AppStrings.tilte,
//                       hintText: AppStrings.tilteHint,
//                       validator: (val) {
//                         if (val!.isEmpty) {
//                           return AppStrings.tilteErrorMsg;
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 24),
//                     //! Note
//                     AddReminderComponent(
//                       controller:
//                           BlocProvider.of<TaskCubit>(context).noteController,
//                       tilte: AppStrings.reminder,
//                       hintText: AppStrings.reminderhint,
//                       validator: (val) {
//                         if (val!.isEmpty) {
//                           return AppStrings.reminderErrorMsg;
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 24),
//                     //! Date
//                     AddReminderComponent(
//                       tilte: AppStrings.date,
//                       hintText: DateFormat.yMd().format(cubit.currentDate),
//                       suffixIcon: IconButton(
//                         onPressed: () async {
//                           BlocProvider.of<TaskCubit>(context).getDate(context);
//                         },
//                         icon: Icon(
//                           Icons.calendar_month_rounded,
//                           color: AppColors.white,
//                         ),
//                       ),
//                       readOnly: true,
//                     ),
//                     const SizedBox(height: 24),
//                     //! Start - End Time
//                     Row(
//                       children: [
//                         // Start
//                         Expanded(
//                           child: AddReminderComponent(
//                             readOnly: true,
//                             tilte: AppStrings.start,
//                             hintText:
//                                 BlocProvider.of<TaskCubit>(context).startTime,
//                             suffixIcon: IconButton(
//                               onPressed: () async {
//                                 BlocProvider.of<TaskCubit>(context)
//                                     .getStartTime(context);
//                               },
//                               icon: Icon(
//                                 Icons.timer_outlined,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 26,
//                         ),
//                         //! end
//                         Expanded(
//                           child: AddReminderComponent(
//                             readOnly: true,
//                             tilte: AppStrings.end,
//                             hintText:
//                                 BlocProvider.of<TaskCubit>(context).endTime,
//                             suffixIcon: IconButton(
//                               onPressed: () async {
//                                 BlocProvider.of<TaskCubit>(context)
//                                     .getEndTime(context);
//                               },
//                               icon: Icon(
//                                 Icons.timer_outlined,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),

//                     //! add Task Button

//                     const SizedBox(height: 90),

//                     state is InsertTaskLoadingState
//                         ? Center(
//                             child: CircularProgressIndicator(
//                             color: AppColors.primarycolor,
//                           ))
//                         : SizedBox(
//                             height: 48,
//                             width: double.infinity,
//                             child: CustomButton(
//                               text: AppStrings.cerate,
//                               onPressed: () {
//                                 if (BlocProvider.of<TaskCubit>(context)
//                                     .formKey
//                                     .currentState!
//                                     .validate()) {
//                                   BlocProvider.of<TaskCubit>(context)
//                                       .insertTask();
//                                 }
//                               },
//                             ),
//                           )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
      
//     );
//   }
// }

// class ReminderDetailsView extends StatefulWidget {
//   const ReminderDetailsView({super.key});

//   @override
//   State<ReminderDetailsView> createState() => _ReminderDetailsViewState();
// }

// class _ReminderDetailsViewState extends State<ReminderDetailsView> {
//   DateTime currentDate = DateTime.now();
//   String timestart = DateFormat('hh:mm a').format(DateTime.now());
// int currentindex=0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0.0,
//         centerTitle: false,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_ios_new_outlined)),
//         title: Text(
//           AppStrings.addareminder,
//           style: CustomTextStyles.lohit500style22,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             //! Title
//             AddReminderComponent(
//               tilte: AppStrings.tilte,
//               hintText: "Name",
//               validator: (val) {
//                 if (val!.isEmpty) {
//                   return AppStrings.tilteErrorMsg;
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 24),
//             //! Note
//             AddReminderComponent(
//               tilte: AppStrings.reminder,
//               hintText: "Description",
//               validator: (val) {
//                 if (val!.isEmpty) {
//                   return AppStrings.reminderErrorMsg;
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 24),
//             //! Date
//             AddReminderComponent(
//               tilte: AppStrings.date,
//               hintText: DateFormat.yMd().format(currentDate),
//               suffixIcon: IconButton(
//                 onPressed: () async {
//                   DateTime? pickeddate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2025));
//                   setState(() {
//                     if (pickeddate != null) {
//                       currentDate = pickeddate;
//                     } else {
              
//                     }
//                   });
//                 },
//                 icon: const Icon(
//                   Icons.calendar_month_rounded,
//                 ),
//               ),
//               readOnly: true,
//             ),
//             const SizedBox(height: 24),
//             Row(children: [
//               // Start
//               Expanded(
//                 child: AddReminderComponent(
//                   readOnly: true,
//                   tilte: AppStrings.start,
//                   hintText: DateFormat('hh:mm a').format(DateTime.now()),
//                   suffixIcon: IconButton(
//                     onPressed: () async {
//                       TimeOfDay? pickedtime = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.fromDateTime(DateTime.now()),
//                       );
//                       setState(() {
//                         if (pickedtime != null) {
//                           timestart = pickedtime.format(context);
//                         } else {
//                         }
//                       });
//                     },
//                     icon: const Icon(
//                       Icons.timer_outlined,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 26,
//               ),
//               const Spacer()
//             ]),
          
            
          
            
//           const SizedBox(height: 105,),
//             //buttn
//             SizedBox(
//               height: 48,
//               width: double.infinity,
//               child: CustomBtn(text: AppStrings.cerate,
//               color: AppColors.primarycolor,
//               onPressed: (){
//                Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const ReminderMedicinsView()));
//               },),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TimeScreen extends StatelessWidget {
  TimeScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add a Reminder',style: CustomTextStyles.lohit500style20,),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                  style: CustomTextStyles.lohit500style20
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Name"
                ,hintStyle: CustomTextStyles.lohit400style18.copyWith(fontSize: 16,color: AppColors.black2)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Reminder',
                    style: CustomTextStyles.lohit500style20
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: "Description"
                    ,hintStyle: CustomTextStyles.lohit400style18.copyWith(fontSize: 16,color: AppColors.black2)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Date',
                    style: CustomTextStyles.lohit500style20
                ),
              ),
              BlocBuilder<CalenderCubit, CalenderState>(
                builder: (context, stateOfCalender) {
                  return BlocBuilder<TimeCubit, TimeState>(
                    builder: (context, stateOfTime) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                hintStyle: CustomTextStyles.lohit400style18.copyWith(fontSize: 16,color: AppColors.black2),
                              hintText: (stateOfCalender
                                      is SuccessShowCalenderPicker)
                                  ? "${stateOfCalender.date}"
                                  :  '${context.read<CalenderCubit>().date}',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.calendar_month_sharp,
                                ),
                                onPressed: () {
                                  context
                                      .read<CalenderCubit>()
                                      .showCalenderPicker(context: context);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Text(
                              'Time',
                                style: CustomTextStyles.lohit500style20
                            ),
                          ),
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                      hintStyle: CustomTextStyles.lohit400style18.copyWith(fontSize: 16,color: AppColors.black2),
                                hintText: (stateOfTime
                                        is SuccessShowTimerPicker)
                                    ? "${stateOfTime.time}"
                                    :"${context.read<TimeCubit>().timeOfDay.format(context)}",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.timer_sharp,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<TimeCubit>()
                                        .showTimerPicker(context: context, title:nameController.text , description: descriptionController.text);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: SizedBox(
                              width: widthScreen,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: (stateOfCalender
                                            is SuccessShowCalenderPicker &&
                                        stateOfTime is SuccessShowTimerPicker)
                                    ? () async {
                                        print(nameController.text);
                                        print(descriptionController.text);
                                        await  LocalNotificationService.init();

                                        LocalNotificationService
                                            .showScheduleNotification(
                                          title: nameController.text,
                                          reminder: descriptionController.text,
                                          year:
                                              stateOfCalender.notificationYear!,
                                          month: stateOfCalender
                                              .notificationMonth!,
                                          day: stateOfCalender.notificationDay!,
                                          hour: stateOfTime.notificationHour!,
                                          minute:
                                              stateOfTime.notificationMinute!,
                                        );
                                        Navigator.pop(context);
                                      }
                                    : null,
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
