class UserModel {
  final String fullName;
  final String slug;
  final int nationalId;
  final String email;
  final String password;
  final String gender;
  final String profileImage;
  final String role;
  final bool active;
  final String sId;
  final String createdAt;
  final String updatedAt;
  final int iV;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel._(
      fullName: json['fullName'],
      slug: json['slug'],
      nationalId: json['nationalId'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      profileImage: json['profileImage'],
      role: json['role'],
      active: json['active'],
      sId: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
    );
  }

  UserModel._(
      {required this.fullName,
      required this.slug,
      required this.nationalId,
      required this.email,
      required this.password,
      required this.gender,
      required this.profileImage,
      required this.role,
      required this.active,
      required this.sId,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['slug'] = slug;
    data['nationalId'] = nationalId;
    data['email'] = email;
    data['password'] = password;
    data['gender'] = gender;
    data['profileImage'] = profileImage;
    data['role'] = role;
    data['active'] = active;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
