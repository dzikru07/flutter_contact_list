class Datum {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? avatar;

  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.avatar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'gender': gender,
        'avatar': avatar,
      };
}
