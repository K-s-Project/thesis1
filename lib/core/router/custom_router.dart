import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:thesis1/presentation/screen/auth/auth_screen.dart';
import 'package:thesis1/presentation/screen/auth/register_screen.dart';
import 'package:thesis1/presentation/screen/extension/add_lesson_screen.dart';
import 'package:thesis1/presentation/screen/extension/add_note_screen.dart';
import 'package:thesis1/presentation/screen/extension/lesson_detail_screen.dart';
import 'package:thesis1/presentation/screen/extension/note_detail_screen.dart';
import 'package:thesis1/presentation/screen/main/admin_screen.dart';
import 'package:thesis1/presentation/screen/main/main_screen.dart';
import 'package:thesis1/presentation/screen/extension/edit_profile_screen.dart';
import '../../domain/entity/lesson_entity.dart';
import '../../domain/entity/note_entity.dart';
import '../../domain/entity/student_entity.dart';
import '../../presentation/screen/extension/view_pdf_screen.dart';
part 'custom_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthScreen,
      initial: true,
    ),
    AutoRoute(page: MainScreen),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: EditProfileScreen),
    AutoRoute(page: AddLessonScreen),
    AutoRoute(page: LessonDetailScreen),
    AutoRoute(page: ViewPdfScreen),
    AutoRoute(page: AdminScreen),
    AutoRoute(page: AddNoteScreen),
    AutoRoute(page: NoteDetailScreenS),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
