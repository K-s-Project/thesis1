import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesis1/core/router/custom_router.dart';
import 'package:thesis1/presentation/state/lesson/lesson_cubit.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/utils/custom_functions.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  void initState() {
    context.read<LessonCubit>().onStreamLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      builder: (context, state) {
        if (state is LessonLoaded) {
          return ListView(
            children: state.lessons.map((e) {
              return Card(
                child: ListTile(
                  onTap: () async {
                    if (await CustomFunctions.isExisting(
                            userId:
                                FirebaseAuth.instance.currentUser?.uid ?? '',
                            id: e.id) &&
                        mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: CustomText('Already answered this lesson'),
                        duration: Duration(milliseconds: 400),
                      ));
                    } else {
                      if (mounted) {
                        AutoRouter.of(context)
                            .push(LessonDetailRoute(lesson: e));
                      }
                    }
                  },
                  title: CustomText(e.name),
                  subtitle: e.createdAt != null
                      ? CustomText(timeago.format(DateTime.parse(e.createdAt!)))
                      : const SizedBox.shrink(),
                ),
              );
            }).toList(),
          );
        } else if (state is LessonEmpty) {
          return const Center(
            child: CustomText('No lesson to see.'),
          );
        } else if (state is LessonLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
