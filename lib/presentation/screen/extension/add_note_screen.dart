import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/domain/entity/note_entity.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

import '../../state/note/note_cubit.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final title = TextEditingController();
  final body = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Add Note'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              CustomTextfield(
                'enter the title',
                controller: title,
                label: const CustomText('Title'),
              ),
              SizedBox(height: 2.h),
              CustomTextfield(
                'enter the body',
                controller: body,
                label: const CustomText('Body'),
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 1.h),
              ),
              SizedBox(height: 2.h),
              BlocListener<NoteCubit, NoteState>(
                listener: (context, state) {
                  if (state is NoteUploading) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                  } else if (state is NoteDone) {
                    if (Navigator.canPop(context)) Navigator.pop(context);
                    if (Navigator.canPop(context)) Navigator.pop(context);
                    context.read<NoteCubit>().onFetchNotes(
                        userId: FirebaseAuth.instance.currentUser?.uid ?? '');
                  }
                },
                child: CustomElevatedButton(
                  'Add note',
                  onPressed: () {
                    final note = NoteEntity(
                      title: title.text,
                      body: body.text,
                      createdAt: DateTime.now().toString(),
                      id: DateTime.now().microsecondsSinceEpoch.toString(),
                    );
                    if (title.text.isNotEmpty && body.text.isNotEmpty) {
                      context.read<NoteCubit>().onCreateNote(
                            userId:
                                FirebaseAuth.instance.currentUser?.uid ?? '',
                            note: note,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: CustomText('please fill up all the field'),
                        duration: Duration(milliseconds: 400),
                      ));
                    }
                  },
                  bgColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
