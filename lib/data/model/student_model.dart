import 'package:thesis1/domain/entity/student_entity.dart';

class StudentModel extends StudentEntity {
  StudentModel({
    required super.uid,
    required super.grade,
    required super.section,
    required super.lrn,
    required super.firstName,
    super.imageUrl,
    required super.email,
    required super.password,
    required super.lastName,
  });
  factory StudentModel.fromE(StudentEntity student) {
    return StudentModel(
      uid: student.uid,
      grade: student.grade,
      section: student.section,
      lrn: student.lrn,
      firstName: student.firstName,
      imageUrl: student.imageUrl,
      email: student.email,
      password: student.password,
      lastName: student.lastName,
    );
  }
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      uid: json['uid'],
      grade: json['grade'],
      section: json['section'],
      lrn: json['lrn'],
      firstName: json['firstName'],
      imageUrl: json['imageUrl'],
      email: json['email'],
      password: json['password'],
      lastName: json['lastName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'grade': grade,
        'section': section,
        'lrn': lrn,
        'firstName': firstName,
        'imageUrl': imageUrl,
        'email': email,
        'password': password,
        'lastName': lastName,
      };
}
