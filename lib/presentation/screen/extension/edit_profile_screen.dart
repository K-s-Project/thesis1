// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/core/constants/defaults.dart';
import 'package:thesis1/core/dto/update_profile_dto.dart';

import 'package:thesis1/domain/entity/student_entity.dart';
import 'package:thesis1/presentation/state/bools/geneq/geneq_cubit.dart';
import 'package:thesis1/presentation/state/bools/grade/grade_cubit.dart';
import 'package:thesis1/presentation/state/bools/lrn/lrn_cubit.dart';
import 'package:thesis1/presentation/state/bools/name/firstname_cubit.dart';
import 'package:thesis1/presentation/state/bools/name/lastname_cubit.dart';
import 'package:thesis1/presentation/state/bools/section/section_cubit.dart';
import 'package:thesis1/presentation/state/image/image_cubit.dart';
import 'package:thesis1/presentation/state/storage/storage_cubit.dart';
import 'package:thesis1/presentation/state/user/user_cubit.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

import '../../widget/custom_text.dart';

class EditProfileScreen extends StatefulWidget {
  final StudentEntity student;
  const EditProfileScreen({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final grade = TextEditingController();
  final section = TextEditingController();
  final lrn = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    firstName.text = widget.student.firstName;
    lastName.text = widget.student.lastName;
    grade.text = widget.student.grade;
    section.text = widget.student.section;
    lrn.text = widget.student.lrn;
  }

  void initCheck() async {
    context
        .read<FirstNameCubit>()
        .checkFirstName(orig: widget.student.firstName, neu: firstName.text);
    context
        .read<GradeCubit>()
        .checkGrade(orig: widget.student.grade, neu: grade.text);
    context
        .read<SectionCubit>()
        .checkSection(orig: widget.student.section, neu: section.text);
    context.read<LrnCubit>().checkLrn(orig: widget.student.lrn, neu: lrn.text);
    context
        .read<LastNameCubit>()
        .checkLastName(orig: widget.student.lastName, neu: lastName.text);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final firstNameEq = context.select((FirstNameCubit name) => name.state);
        final lastNameEq = context.select((LastNameCubit name) => name.state);
        final gradeEq = context.select((GradeCubit grade) => grade.state);
        final sectionEq =
            context.select((SectionCubit section) => section.state);
        final lrnEq = context.select((LrnCubit lrn) => lrn.state);
        final image = context.select((ImageCubit image) => image.state);
        final genEq = context.select((GeneqCubit gen) => gen.state);
        context.read<GeneqCubit>().canUpdate(
              image: image != null,
              firstName: firstNameEq,
              grade: gradeEq,
              section: sectionEq,
              lrn: lrnEq,
              lastName: lastNameEq,
            );
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: const CustomText('Edit Profile'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(DEFAULT_PADDING.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 15.h,
                        width: 15.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade300,
                        ),
                        child: widget.student.imageUrl == null
                            ? image == null
                                ? CustomText(
                                    widget.student.firstName.characters.first,
                                    size: 20.sp,
                                    color: Colors.white,
                                    weight: FontWeight.bold,
                                  )
                                : Image.file(
                                    File(image.path),
                                    fit: BoxFit.cover,
                                  )
                            : image == null
                                ? CachedNetworkImage(
                                    imageUrl: widget.student.imageUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(image.path),
                                    fit: BoxFit.cover,
                                  ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () {
                            scaffoldKey.currentState!.showBottomSheet((_) {
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      context
                                          .read<ImageCubit>()
                                          .pickImage(ImageSource.gallery)
                                          .then((value) =>
                                              Navigator.pop(context));
                                    },
                                    leading: const Icon(Icons.image_rounded),
                                    title: const CustomText('Gallery'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      context
                                          .read<ImageCubit>()
                                          .pickImage(ImageSource.camera)
                                          .then((value) =>
                                              Navigator.pop(context));
                                    },
                                    leading:
                                        const Icon(Icons.camera_indoor_rounded),
                                    title: const CustomText('Camera'),
                                  ),
                                ],
                              );
                            });
                          },
                          child: Container(
                            height: 4.h,
                            alignment: Alignment.center,
                            width: 15.h,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                            ),
                            child: const CustomText('Pick Image'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'First Name',
                    controller: firstName,
                    label: const CustomText('First Name'),
                    suffix: Icon(firstNameEq ? Icons.autorenew : Icons.check),
                    onChanged: (v) {
                      context.read<FirstNameCubit>().checkFirstName(
                          orig: widget.student.firstName, neu: v);
                    },
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'Last Name',
                    controller: lastName,
                    label: const CustomText('Last Name'),
                    suffix: Icon(firstNameEq ? Icons.autorenew : Icons.check),
                    onChanged: (v) {
                      context.read<LastNameCubit>().checkLastName(
                          orig: widget.student.firstName, neu: v);
                    },
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'Grade',
                    controller: grade,
                    label: const CustomText('Grade'),
                    suffix: Icon(gradeEq ? Icons.autorenew : Icons.check),
                    onChanged: (v) {
                      context
                          .read<GradeCubit>()
                          .checkGrade(orig: widget.student.grade, neu: v);
                    },
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'Section',
                    controller: section,
                    label: const CustomText('Section'),
                    suffix: Icon(sectionEq ? Icons.autorenew : Icons.check),
                    onChanged: (v) {
                      context
                          .read<SectionCubit>()
                          .checkSection(orig: widget.student.section, neu: v);
                    },
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'LRN',
                    controller: lrn,
                    label: const CustomText('LRN'),
                    suffix: Icon(lrnEq ? Icons.autorenew : Icons.check),
                    onChanged: (v) {
                      context
                          .read<LrnCubit>()
                          .checkLrn(orig: widget.student.lrn, neu: v);
                    },
                  ),
                  SizedBox(height: 2.h),
                  if (genEq)
                    CustomElevatedButton(
                      'Update',
                      onPressed: () {
                        if (image != null) {
                          context.read<StorageCubit>().onUploadToStorage(
                                path:
                                    'profile/${FirebaseAuth.instance.currentUser?.uid}',
                                file: File(image.path),
                              );
                        } else {
                          final dto = UpdateProfileDto(
                            uid: FirebaseAuth.instance.currentUser?.uid ?? '',
                            firstName: firstName.text,
                            lastName: lastName.text,
                            grade: grade.text,
                            section: section.text,
                            lrn: lrn.text,
                          );
                          context
                              .read<UserCubit>()
                              .onUpdateProfile(
                                updateProfileDto: dto,
                                existingUrl: widget.student.imageUrl,
                              )
                              .then((value) => context
                                  .read<UserCubit>()
                                  .onFetchUserById(
                                      id: FirebaseAuth
                                              .instance.currentUser?.uid ??
                                          ''));
                        }
                      },
                      bgColor: Theme.of(context).primaryColor,
                      color: Colors.white,
                    ),
                  //*no-image
                  if (image == null)
                    BlocListener<UserCubit, UserState>(
                      listener: (contex, state) {
                        if (state is Updating) {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (_) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                );
                              });
                        } else if (state is Updated) {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                            AutoRouter.of(context).popUntilRoot();
                            context.read<FirstNameCubit>().dispose();
                            context.read<GradeCubit>().dispose();
                            context.read<SectionCubit>().dispose();
                            context.read<LrnCubit>().dispose();
                            context.read<GeneqCubit>().dispose();
                            context.read<ImageCubit>().dispose();
                          }
                        }
                      },
                      child: const SizedBox.shrink(),
                    ),
                  //*with-image
                  BlocListener<StorageCubit, StorageState>(
                    listener: (contex, state) {
                      if (state is Uploading) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            });
                      } else if (state is Uploaded) {
                        final dto = UpdateProfileDto(
                          uid: FirebaseAuth.instance.currentUser?.uid ?? '',
                          firstName: firstName.text,
                          lastName: lastName.text,
                          grade: grade.text,
                          section: section.text,
                          lrn: lrn.text,
                        );
                        context
                            .read<UserCubit>()
                            .onUpdateProfile(
                                updateProfileDto: dto, path: state.path)
                            .then((value) {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                            AutoRouter.of(context).popUntilRoot();
                            context.read<FirstNameCubit>().dispose();
                            context.read<GradeCubit>().dispose();
                            context.read<SectionCubit>().dispose();
                            context.read<LrnCubit>().dispose();
                            context.read<GeneqCubit>().dispose();
                            context.read<ImageCubit>().dispose();
                            context.read<UserCubit>().onFetchUserById(
                                id: FirebaseAuth.instance.currentUser?.uid ??
                                    '');
                          }
                        });
                      }
                    },
                    child: const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
