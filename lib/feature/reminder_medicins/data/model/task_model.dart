class ReminderModel {
  final int? id;
  final String title;
  final String note;
  final String startTime;
  final String endTime;
  final String date;
  final int isCompleted;
  final int color;

  ReminderModel({
    this.id,
    required this.date,
    required this.title,
    required this.note,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
    required this.color,
  });
  factory ReminderModel.fromJson(Map<String, dynamic> jsonData) {
    return ReminderModel(
      id:jsonData['id'],
      date: jsonData['date'],
      title: jsonData['title'],
      note: jsonData['note'],
      startTime: jsonData['startTime'],
      endTime: jsonData['endTime'],
      isCompleted: jsonData['isCompleted'],
      color: jsonData['color'],
    );
  }
}
