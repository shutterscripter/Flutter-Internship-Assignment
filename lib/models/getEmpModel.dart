class GetEmpModel {
  String? id;
  String? employeeName;
  String? employeeSalary;
  String? employeeAge;
  String? profileImage;

  GetEmpModel(
      {required this.id,
      required this.employeeName,
      required this.employeeSalary,
      required this.employeeAge,
      required this.profileImage});

  factory GetEmpModel.fromJson(Map<String, dynamic> json) {
    return GetEmpModel(
      id: json['id'].toString(),
      employeeName: json['employee_name'].toString(),
      employeeSalary: json['employee_salary'].toString(),
      employeeAge: json['employee_age'].toString(),
      profileImage: json['profile_image'] ?? '',
    );
  }
}
