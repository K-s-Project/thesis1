// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Emoji {
  final String emoji;
  final String label;
  Emoji({
    required this.emoji,
    required this.label,
  });
}

List<Emoji> feedbacks = [
  Emoji(
    emoji: Ph.smiley_fill,
    label: 'Very Satisfied',
  ),
  Emoji(
    emoji: Ph.smiley_meh_fill,
    label: 'Satisfied',
  ),
  Emoji(
    emoji: Ph.smiley_sad_fill,
    label: 'Not Satisfied',
  ),
];
