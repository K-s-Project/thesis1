import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thesis1/data/model/lesson_model.dart';

class CustomFunctions {
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<bool> isExisting({
    required String userId,
    required String id,
  }) async {
    final user =
        await FirebaseFirestore.instance.collection('lessons').doc(id).get();
    final lesson = LessonModel.fromJson(user.data()!);
    if ((lesson.students ?? []).contains(userId)) {
      return true;
    } else {
      return false;
    }
  }
}
