class PatientModel {
  final String age,
      name,
      weight,
      height,
      status,
      diabeticComa,
      somking,
      geneticDiabetes,
      bloodPresure,
      heartDisease,
      alcohols,
      pancreasDisease,
      breastfeeding;
  final String oralContraceptives;
  PatientModel({
     required this.name,
    required this.age,
    required this.weight,
    required this.height,
    required this.status,
    required this.diabeticComa,
    required this.somking,
    required this.geneticDiabetes,
    required this.bloodPresure,
    required this.heartDisease,
    required this.alcohols,
    required this.pancreasDisease,
    required this.breastfeeding,
    required this.oralContraceptives,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['fullName'],
      age: json['age'].toString(),
      weight: json['weight'].toString(),
      height: json['height'].toString(),
      status: json['status'],
      diabeticComa: json['diabeticComa'].toString(),
      somking: json['somking'].toString(),
      geneticDiabetes: json['geneticDiabetes'].toString(),
      bloodPresure: json['bloodPresure'].toString(),
      heartDisease: json['heartDisease'].toString(),
      alcohols: json['alcohols'].toString(),
      pancreasDisease: json['pancreasDisease'].toString(),
      oralContraceptives: json['oralContraceptives'].toString(),
      breastfeeding: json['breastfeeding'].toString(),
    );
  }
}
//  "age":"30",
//     "weight":"90",
//     "height":"190",
//     "status":"Single",
//     "diabeticComa":"true",
//     "somking":"true",
//     "geneticDiabetes":"true",
//     "bloodPresure":"true",
//     "heartDisease":"false",
//     "alcohols":"true",
//     "pancreasDisease":"true",
// //***** For Female *****
//     "oralContraceptives":"false",