// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:thesis1/domain/entity/note_entity.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

import '../../state/note/note_cubit.dart';
import '../../widget/custom_elevated_button.dart';

class NoteDetailScreenS extends StatefulWidget {
  final NoteEntity note;
  const NoteDetailScreenS({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<NoteDetailScreenS> createState() => _NoteDetailScreenSState();
}

class _NoteDetailScreenSState extends State<NoteDetailScreenS> {
  final title = TextEditingController();
  final body = TextEditingController();
  @override
  void initState() {
    super.initState();
    title.text = widget.note.title;
    body.text = widget.note.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Note'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              CustomTextfield(
                'title',
                controller: title,
                padding: EdgeInsets.all(2.h),
              ),
              SizedBox(height: 2.h),
              CustomTextfield(
                'body',
                controller: body,
                padding: EdgeInsets.all(2.h),
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
                  'Update note',
                  onPressed: () {
                    final note = NoteEntity(
                      title: title.text,
                      body: body.text,
                      createdAt: DateTime.now().toString(),
                      id: widget.note.id,
                    );
                    if (title.text.isNotEmpty && body.text.isNotEmpty) {
                      context.read<NoteCubit>().onUpdateNote(
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
