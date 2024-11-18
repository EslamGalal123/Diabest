class DoctorsModel {
  final String phoneNumber,
      startTime,
      endTime,
      clinicAddress,
      facebookLink,
      whatsappLink,
      specialization,fullName
      ;
  DoctorsModel({
  required  this.fullName,
    required this.phoneNumber,
    required this.startTime,
    required this.endTime,
    required this.clinicAddress,
    required this.facebookLink,
    required this.whatsappLink,
    required this.specialization,
  });
  factory DoctorsModel.fromJson(Map<String, dynamic> json,
      { String? fullName, required String specialization}) {
    return DoctorsModel(
      fullName: fullName ?? json['fullName'],
      phoneNumber: json['phoneNumber'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      clinicAddress: json['clinicAddress'],
      facebookLink: json['facebookLink'],
      whatsappLink: json['whatsappLink'],
      specialization: specialization,
    );
  }
}
