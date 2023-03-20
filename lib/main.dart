import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thesis1/core/router/custom_router.dart';
import 'package:thesis1/dependency.dart';
import 'package:thesis1/presentation/state/acts/act1_cubit.dart';
import 'package:thesis1/presentation/state/acts/act1bool_cubit.dart';
import 'package:thesis1/presentation/state/acts/act2_cubit.dart';
import 'package:thesis1/presentation/state/acts/act2bool_cubit.dart';
import 'package:thesis1/presentation/state/acts/act3_cubit.dart';
import 'package:thesis1/presentation/state/acts/act3bool_cubit.dart';
import 'package:thesis1/presentation/state/acts/act4_cubit.dart';
import 'package:thesis1/presentation/state/acts/act4bool_cubit.dart';
import 'package:thesis1/presentation/state/acts/act5_cubit.dart';
import 'package:thesis1/presentation/state/acts/act5bool_cubit.dart';
import 'package:thesis1/presentation/state/acts/acts1_cubit.dart';
import 'package:thesis1/presentation/state/acts/acts2_cubit.dart';
import 'package:thesis1/presentation/state/auths/login/login_cubit.dart';
import 'package:thesis1/presentation/state/auths/register/register_cubit.dart';
import 'package:thesis1/presentation/state/basics/bnb/bnb_cubit.dart';
import 'package:thesis1/presentation/state/basics/feedback/feedback_cubit.dart';
import 'package:thesis1/presentation/state/basics/obscure/obscure_cubit.dart';
import 'package:thesis1/presentation/state/basics/section_dd/section_dd_cubit.dart';
import 'package:thesis1/presentation/state/basics/stepper/stepper_cubit.dart';
import 'package:thesis1/presentation/state/bools/geneq/geneq_cubit.dart';
import 'package:thesis1/presentation/state/bools/grade/grade_cubit.dart';
import 'package:thesis1/presentation/state/bools/lrn/lrn_cubit.dart';
import 'package:thesis1/presentation/state/bools/name/firstname_cubit.dart';
import 'package:thesis1/presentation/state/bools/name/lastname_cubit.dart';
import 'package:thesis1/presentation/state/bools/section/section_cubit.dart';
import 'package:thesis1/presentation/state/file_pickers/file_pickerfirst_cubit.dart';
import 'package:thesis1/presentation/state/file_pickers/file_pickerfourt_cubit.dart';
import 'package:thesis1/presentation/state/file_pickers/file_pickersecond_cubit.dart';
import 'package:thesis1/presentation/state/file_pickers/file_pickerthird_cubit.dart';
import 'package:thesis1/presentation/state/image/image_cubit.dart';
import 'package:thesis1/presentation/state/lesson/lesson_cubit.dart';
import 'package:thesis1/presentation/state/note/note_cubit.dart';
import 'package:thesis1/presentation/state/persistence/persistence_cubit.dart';
import 'package:thesis1/presentation/state/record/record_cubit.dart';
import 'package:thesis1/presentation/state/role/role_cubit.dart';
import 'package:thesis1/presentation/state/storage/storage_cubit.dart';
import 'package:thesis1/presentation/state/user/user_cubit.dart';
import 'package:thesis1/presentation/state/usercheck/user_check_cubit.dart';
import 'firebase_options.dart';
import 'presentation/state/answers/answers.dart';

SharedPreferences? globalSharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  globalSharedPreferences = await SharedPreferences.getInstance();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserCheckCubit>()..onUserCheck(),
        ),
        BlocProvider(
          create: (context) => ObscureCubit(),
        ),
        BlocProvider(
          create: (context) => sl<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => BnbCubit(),
        ),
        BlocProvider(
          create: (context) => FirstNameCubit(),
        ),
        BlocProvider(
          create: (context) => GradeCubit(),
        ),
        BlocProvider(
          create: (context) => SectionCubit(),
        ),
        BlocProvider(
          create: (context) => LrnCubit(),
        ),
        BlocProvider(
          create: (context) => GeneqCubit(),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
          create: (context) => sl<StorageCubit>(),
        ),
        BlocProvider(
          create: (context) => SectionDdCubit(),
        ),
        BlocProvider(
          create: (context) => LastNameCubit(),
        ),
        BlocProvider(
          create: (context) => sl<RoleCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<RegisterCubit>(),
        ),
        BlocProvider(
          create: (context) => StepperCubit(),
        ),
        BlocProvider(
          create: (context) => FilePickerFirstCubit(),
        ),
        BlocProvider(
          create: (context) => FilePickersecondCubit(),
        ),
        BlocProvider(
          create: (context) => FilePickerthirdCubit(),
        ),
        BlocProvider(
          create: (context) => sl<LessonCubit>()..onStreamLessons(),
        ),
        BlocProvider(
          create: (context) => Answer1Cubit(),
        ),
        BlocProvider(
          create: (context) => Answer2Cubit(),
        ),
        BlocProvider(
          create: (context) => Answer3Cubit(),
        ),
        BlocProvider(
          create: (context) => Answer4Cubit(),
        ),
        BlocProvider(
          create: (context) => Answer5Cubit(),
        ),
        BlocProvider(
          create: (context) => sl<RecordCubit>(),
        ),
        BlocProvider(
          create: (context) => Act1Cubit(),
        ),
        BlocProvider(
          create: (context) => Act2Cubit(),
        ),
        BlocProvider(
          create: (context) => Act3Cubit(),
        ),
        BlocProvider(
          create: (context) => Act4Cubit(),
        ),
        BlocProvider(
          create: (context) => Act5Cubit(),
        ),
        BlocProvider(
          create: (context) => Acts2Cubit(),
        ),
        BlocProvider(
          create: (context) => Acts1Cubit(),
        ),
        BlocProvider(
          create: (context) => Act1boolCubit(),
        ),
        BlocProvider(
          create: (context) => Act2boolCubit(),
        ),
        BlocProvider(
          create: (context) => Act3boolCubit(),
        ),
        BlocProvider(
          create: (context) => Act4boolCubit(),
        ),
        BlocProvider(
          create: (context) => Act5boolCubit(),
        ),
        BlocProvider(
          create: (context) => sl<PersistenceCubit>(),
        ),
        BlocProvider(
          create: (context) => FilePickerFourthCubit(),
        ),
        BlocProvider(
          create: (context) => FeedbackCubit(),
        ),
        BlocProvider(
          create: (context) => sl<NoteCubit>(),
        ),
      ],
      child: ResponsiveSizer(builder: (p0, p1, p2) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          title: 'University of Rizal E-Learning',
          theme: ThemeData(
            useMaterial3: true,
            dividerTheme: const DividerThemeData(
              color: Color(0xFF537FE7),
            ),
            primaryColor: const Color(0xFF537FE7),
          ),
        );
      }),
    );
  }
}

class FilePicker1Cubit {}
