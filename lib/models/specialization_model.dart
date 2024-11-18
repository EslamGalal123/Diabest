class SpecializationModel {
  final String id, specialization, imageUrl;

  SpecializationModel(
      {required this.id, required this.specialization, required this.imageUrl});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(
      id: json['_id'],
      specialization: json['specialization'],
      imageUrl: json['specializationImage'],
    );
  }
}
