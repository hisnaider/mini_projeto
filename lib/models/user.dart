class UserModel {
  String id;
  DateTime createDate;
  String name;
  String email;
  String role;
  String agency;
  String unit;
  String registration;

  UserModel({
    required this.id,
    required this.createDate,
    required this.name,
    required this.email,
    required this.role,
    required this.agency,
    required this.unit,
    required this.registration,
  });
}
