// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'custom_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterScreen(),
      );
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditProfileScreen(
          key: args.key,
          student: args.student,
        ),
      );
    },
    AddLessonRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddLessonScreen(),
      );
    },
    LessonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LessonDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LessonDetailScreen(
          key: args.key,
          lesson: args.lesson,
        ),
      );
    },
    ViewPdfRoute.name: (routeData) {
      final args = routeData.argsAs<ViewPdfRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ViewPdfScreen(
          key: args.key,
          pdfLink: args.pdfLink,
        ),
      );
    },
    AdminRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AdminScreen(),
      );
    },
    AddNoteRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddNoteScreen(),
      );
    },
    NoteDetailRouteS.name: (routeData) {
      final args = routeData.argsAs<NoteDetailRouteSArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NoteDetailScreenS(
          key: args.key,
          note: args.note,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AuthRoute.name,
          path: '/',
        ),
        RouteConfig(
          MainRoute.name,
          path: '/main-screen',
        ),
        RouteConfig(
          RegisterRoute.name,
          path: '/register-screen',
        ),
        RouteConfig(
          EditProfileRoute.name,
          path: '/edit-profile-screen',
        ),
        RouteConfig(
          AddLessonRoute.name,
          path: '/add-lesson-screen',
        ),
        RouteConfig(
          LessonDetailRoute.name,
          path: '/lesson-detail-screen',
        ),
        RouteConfig(
          ViewPdfRoute.name,
          path: '/view-pdf-screen',
        ),
        RouteConfig(
          AdminRoute.name,
          path: '/admin-screen',
        ),
        RouteConfig(
          AddNoteRoute.name,
          path: '/add-note-screen',
        ),
        RouteConfig(
          NoteDetailRouteS.name,
          path: '/note-detail-screen-s',
        ),
      ];
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: '/',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-screen',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [EditProfileScreen]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required StudentEntity student,
  }) : super(
          EditProfileRoute.name,
          path: '/edit-profile-screen',
          args: EditProfileRouteArgs(
            key: key,
            student: student,
          ),
        );

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({
    this.key,
    required this.student,
  });

  final Key? key;

  final StudentEntity student;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, student: $student}';
  }
}

/// generated route for
/// [AddLessonScreen]
class AddLessonRoute extends PageRouteInfo<void> {
  const AddLessonRoute()
      : super(
          AddLessonRoute.name,
          path: '/add-lesson-screen',
        );

  static const String name = 'AddLessonRoute';
}

/// generated route for
/// [LessonDetailScreen]
class LessonDetailRoute extends PageRouteInfo<LessonDetailRouteArgs> {
  LessonDetailRoute({
    Key? key,
    required LessonEntity lesson,
  }) : super(
          LessonDetailRoute.name,
          path: '/lesson-detail-screen',
          args: LessonDetailRouteArgs(
            key: key,
            lesson: lesson,
          ),
        );

  static const String name = 'LessonDetailRoute';
}

class LessonDetailRouteArgs {
  const LessonDetailRouteArgs({
    this.key,
    required this.lesson,
  });

  final Key? key;

  final LessonEntity lesson;

  @override
  String toString() {
    return 'LessonDetailRouteArgs{key: $key, lesson: $lesson}';
  }
}

/// generated route for
/// [ViewPdfScreen]
class ViewPdfRoute extends PageRouteInfo<ViewPdfRouteArgs> {
  ViewPdfRoute({
    Key? key,
    required String pdfLink,
  }) : super(
          ViewPdfRoute.name,
          path: '/view-pdf-screen',
          args: ViewPdfRouteArgs(
            key: key,
            pdfLink: pdfLink,
          ),
        );

  static const String name = 'ViewPdfRoute';
}

class ViewPdfRouteArgs {
  const ViewPdfRouteArgs({
    this.key,
    required this.pdfLink,
  });

  final Key? key;

  final String pdfLink;

  @override
  String toString() {
    return 'ViewPdfRouteArgs{key: $key, pdfLink: $pdfLink}';
  }
}

/// generated route for
/// [AdminScreen]
class AdminRoute extends PageRouteInfo<void> {
  const AdminRoute()
      : super(
          AdminRoute.name,
          path: '/admin-screen',
        );

  static const String name = 'AdminRoute';
}

/// generated route for
/// [AddNoteScreen]
class AddNoteRoute extends PageRouteInfo<void> {
  const AddNoteRoute()
      : super(
          AddNoteRoute.name,
          path: '/add-note-screen',
        );

  static const String name = 'AddNoteRoute';
}

/// generated route for
/// [NoteDetailScreenS]
class NoteDetailRouteS extends PageRouteInfo<NoteDetailRouteSArgs> {
  NoteDetailRouteS({
    Key? key,
    required NoteEntity note,
  }) : super(
          NoteDetailRouteS.name,
          path: '/note-detail-screen-s',
          args: NoteDetailRouteSArgs(
            key: key,
            note: note,
          ),
        );

  static const String name = 'NoteDetailRouteS';
}

class NoteDetailRouteSArgs {
  const NoteDetailRouteSArgs({
    this.key,
    required this.note,
  });

  final Key? key;

  final NoteEntity note;

  @override
  String toString() {
    return 'NoteDetailRouteSArgs{key: $key, note: $note}';
  }
}
