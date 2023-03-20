// ignore_for_file: public_member_api_docs, sort_constructors_first
class UpdateProfileDto {
  final String uid;
  final String firstName;
  final String lastName;
  final String grade;
  final String section;
  final String lrn;
  String? image;
  UpdateProfileDto({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.grade,
    required this.section,
    required this.lrn,
    this.image,
  });
}
