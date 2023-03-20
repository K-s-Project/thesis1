import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/core/router/custom_router.dart';
import '../../../core/constants/strings.dart';
import '../../../core/utils/custom_functions.dart';
import '../../state/lesson/lesson_cubit.dart';
import '../../widget/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: Image.asset(RIZAL_LOGO),
        title: const CustomText(
          'Admin',
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          Image.asset(SCHOOL_LOGO),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const CustomText('Logout'),
                      content:
                          const CustomText('Are you sure you want to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const CustomText('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            CustomFunctions.logout()
                                .then((value) => Navigator.pop(context));
                          },
                          child: const CustomText('Logout'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<LessonCubit, LessonState>(
        builder: (context, state) {
          if (state is LessonLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.h, top: 1.h),
                  child: CustomText(
                    'Total: ${state.lessons.length}',
                    size: 16.sp,
                    weight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: state.lessons.map((e) {
                      return Card(
                        child: ListTile(
                          subtitle: e.createdAt != null
                              ? CustomText(
                                  timeago.format(DateTime.parse(e.createdAt!)))
                              : const SizedBox.shrink(),
                          title: CustomText(e.name),
                          trailing: IconButton(
                            iconSize: 3.h,
                            color: Theme.of(context).colorScheme.error,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: const CustomText('Delete Lesson'),
                                      content: const CustomText(
                                          'Are you sure you want to delete this lesson?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const CustomText('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            context
                                                .read<LessonCubit>()
                                                .onDeleteLesson(id: e.id)
                                                .then((value) =>
                                                    Navigator.pop(context));
                                          },
                                          child: const CustomText('Delete'),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(Icons.delete_forever),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(const AddLessonRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
