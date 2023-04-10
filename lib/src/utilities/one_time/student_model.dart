import 'dart:convert';

class StudentModel {
  String? name;
  String? school;
  int? age;
  StudentModel({
    this.name,
    this.school,
    this.age,
  });

  StudentModel copyWith({
    String? name,
    String? school,
    int? age,
  }) {
    return StudentModel(
      name: name ?? this.name,
      school: school ?? this.school,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'school': school,
      'age': age,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'] != null ? map['name'] as String : null,
      school: map['school'] != null ? map['school'] as String : null,
      age: map['age'] != null ? map['age'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StudentModel(name: $name, school: $school, age: $age)';

  @override
  bool operator ==(covariant StudentModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.school == school && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ school.hashCode ^ age.hashCode;
}

List<StudentModel> mockData = [
  StudentModel(name: "sovann", age: 19, school: "sovannaphumi"),
  StudentModel(name: "lucky", age: 19, school: "rupp"),
  StudentModel(name: "something", age: 19, school: "unknown")
];

List<StudentModel> newMockData = [
  StudentModel(name: "ponleur", age: 19, school: "sovannaphumi"),
  StudentModel(name: "pisal", age: 19, school: "rupp"),
  StudentModel(name: "rith", age: 19, school: "num")
];

StudentModel mockStudentModel =
    StudentModel(name: "new name", age: 20, school: "no school");
