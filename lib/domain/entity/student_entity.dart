// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudentEntity {
  final String uid;
  final String? imageUrl;
  final String grade;
  final String section;
  final String lrn;
  final String firstName;
  final String lastName;

  final String email;
  final String password;
  StudentEntity({
    required this.uid,
    this.imageUrl,
    required this.grade,
    required this.section,
    required this.lrn,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
