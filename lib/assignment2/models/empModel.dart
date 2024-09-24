
class EmployeeModel {
  late String name;
  late int age;
  late int salary;

   EmployeeModel({
    required this.name,
    required this.age,
    required this.salary,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      name: json['name'],
      age: json['age'],
      salary: json['salary'],
    );
  }
}