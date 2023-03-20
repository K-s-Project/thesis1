import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/core/router/custom_router.dart';
import 'package:thesis1/presentation/state/note/note_cubit.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<NoteCubit>()
        .onFetchNotes(userId: FirebaseAuth.instance.currentUser?.uid ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<NoteCubit>()
            .onFetchNotes(userId: FirebaseAuth.instance.currentUser?.uid ?? '');
      },
      child: ListView(
        clipBehavior: Clip.none,
        dragStartBehavior: DragStartBehavior.start,
        children: [
          Padding(
            padding: EdgeInsets.all(1.h),
            child: CustomElevatedButton(
              'Add note',
              onPressed: () {
                AutoRouter.of(context).push(const AddNoteRoute());
              },
              bgColor: Theme.of(context).primaryColor,
              color: Colors.white,
            ),
          ),
          BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              if (state is NoteLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: state.notes.map((e) {
                      return ListTile(
                        onTap: () {
                          AutoRouter.of(context)
                              .push(NoteDetailRouteS(note: e));
                        },
                        title: CustomText(
                          e.title,
                          size: 16.sp,
                          weight: FontWeight.w600,
                        ),
                        subtitle: CustomText(
                          e.body,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          size: 15.sp,
                        ),
                        trailing: CustomText(
                            timeago.format(DateTime.parse(e.createdAt))),
                      );
                    }).toList(),
                  ),
                );
              } else if (state is NoteLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NoteEmpty) {
                return Center(
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/image/note.svg', height: 30.h),
                      CustomText(
                        'There are no notes to view.',
                        color: Theme.of(context).primaryColor,
                        size: 16.sp,
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
