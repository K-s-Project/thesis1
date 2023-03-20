import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/domain/entity/lesson_entity.dart';
import 'package:thesis1/presentation/state/basics/stepper/stepper_cubit.dart';
import 'package:thesis1/presentation/state/lesson/lesson_cubit.dart';
import 'package:thesis1/presentation/state/storage/storage_cubit.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

import '../../state/file_pickers/file_pickerfirst_cubit.dart';
import '../../state/file_pickers/file_pickerfourt_cubit.dart';
import '../../state/file_pickers/file_pickersecond_cubit.dart';
import '../../state/file_pickers/file_pickerthird_cubit.dart';
import '../../widget/custom_text.dart';

class AddLessonScreen extends StatefulWidget {
  const AddLessonScreen({super.key});

  @override
  State<AddLessonScreen> createState() => _AddLessonScreenState();
}

class _AddLessonScreenState extends State<AddLessonScreen> {
  final directions1 = TextEditingController();
  final directions2 = TextEditingController();
  final directions3 = TextEditingController();
  final name = TextEditingController();
  final vocabJ1 = TextEditingController();
  final vocabJ2 = TextEditingController();
  final vocabJ3 = TextEditingController();
  final vocabJ4 = TextEditingController();
  final vocabJ5 = TextEditingController();
  final vocabJ6 = TextEditingController();
  final vocabJ7 = TextEditingController();
  final vocabJ8 = TextEditingController();
  final vocabP1 = TextEditingController();
  final vocabP2 = TextEditingController();
  final vocabP3 = TextEditingController();
  final vocabP4 = TextEditingController();
  final vocabP5 = TextEditingController();
  final vocabP6 = TextEditingController();
  final vocabP7 = TextEditingController();
  final vocabP8 = TextEditingController();
  final vocabD1 = TextEditingController();
  final vocabD2 = TextEditingController();
  final vocabD3 = TextEditingController();
  final vocabD4 = TextEditingController();
  final vocabD5 = TextEditingController();
  final vocabD6 = TextEditingController();
  final vocabD7 = TextEditingController();
  final vocabD8 = TextEditingController();
  final vocabS1 = TextEditingController();
  final vocabS2 = TextEditingController();
  final vocabS3 = TextEditingController();
  final vocabS4 = TextEditingController();
  final vocabS5 = TextEditingController();
  final vocabS6 = TextEditingController();
  final vocabS7 = TextEditingController();
  final vocabS8 = TextEditingController();
  final vocabA1 = TextEditingController();
  final vocabA2 = TextEditingController();
  final vocabA3 = TextEditingController();
  final vocabA4 = TextEditingController();
  final vocabA5 = TextEditingController();
  final vocabA6 = TextEditingController();
  final vocabA7 = TextEditingController();
  final vocabA8 = TextEditingController();
  final model1 = TextEditingController();
  final model2 = TextEditingController();
  final model3 = TextEditingController();
  final model4 = TextEditingController();
  final model5 = TextEditingController();
  final yt1 = TextEditingController();
  final yt2 = TextEditingController();
  final jointQ1 = TextEditingController();
  final jointQ2 = TextEditingController();
  final jointQ3 = TextEditingController();
  final jointQ4 = TextEditingController();
  final jointQ5 = TextEditingController();
  final jointA1 = TextEditingController();
  final jointA2 = TextEditingController();
  final jointA3 = TextEditingController();
  final jointA4 = TextEditingController();
  final jointA5 = TextEditingController();
  List<TextEditingController> jointC1 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> jointC2 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> jointC3 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> jointC4 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> jointC5 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  late Activity1Entity act1;
  late Activity2Entity act2;
  late Activity3Entity act3;
  late String pdfFirst;
  late String pdfSecond;
  late String pdfThird;
  late String pdfFourth;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final currentStep =
            context.select((StepperCubit stepper) => stepper.state);
        final pdf1 = context.select((FilePickerFirstCubit file) => file.state);
        final pdf2 = context.select((FilePickersecondCubit file) => file.state);
        final pdf3 = context.select((FilePickerthirdCubit file) => file.state);
        final pdf4 = context.select((FilePickerFourthCubit file) => file.state);
        return SafeArea(
          child: Scaffold(
            body: BlocListener<StorageCubit, StorageState>(
              listener: (context, state) {
                if (state is Uploading) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                } else if (state is Uploaded1) {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                  pdfFirst = state.path;
                  act1 = Activity1Entity(
                    fitbs: [
                      FITBEntity(
                        answer: vocabA1.text,
                        sentence: vocabS1.text,
                        pronounciation: vocabP1.text,
                        definition: vocabD1.text,
                        jumbledWord: vocabJ1.text,
                      ),
                      FITBEntity(
                        answer: vocabA2.text,
                        sentence: vocabS2.text,
                        pronounciation: vocabP2.text,
                        definition: vocabD2.text,
                        jumbledWord: vocabJ2.text,
                      ),
                      FITBEntity(
                        answer: vocabA3.text,
                        sentence: vocabS3.text,
                        pronounciation: vocabP3.text,
                        definition: vocabD3.text,
                        jumbledWord: vocabJ3.text,
                      ),
                      FITBEntity(
                        answer: vocabA4.text,
                        sentence: vocabS4.text,
                        pronounciation: vocabP4.text,
                        definition: vocabD4.text,
                        jumbledWord: vocabJ4.text,
                      ),
                      FITBEntity(
                        answer: vocabA5.text,
                        sentence: vocabS5.text,
                        pronounciation: vocabP5.text,
                        definition: vocabD5.text,
                        jumbledWord: vocabJ5.text,
                      ),
                      FITBEntity(
                        answer: vocabA6.text,
                        sentence: vocabS6.text,
                        pronounciation: vocabP6.text,
                        definition: vocabD6.text,
                        jumbledWord: vocabJ6.text,
                      ),
                      FITBEntity(
                        answer: vocabA7.text,
                        sentence: vocabS7.text,
                        pronounciation: vocabP7.text,
                        definition: vocabD7.text,
                        jumbledWord: vocabJ7.text,
                      ),
                      FITBEntity(
                        answer: vocabA8.text,
                        sentence: vocabS8.text,
                        pronounciation: vocabP8.text,
                        definition: vocabD8.text,
                        jumbledWord: vocabJ8.text,
                      ),
                    ],
                    directions: directions1.text,
                    pdf: pdfFirst,
                  );
                } else if (state is Uploaded2) {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                  pdfSecond = state.path;
                  act2 = Activity2Entity(
                    pdf: pdfSecond,
                    questions: [
                      model1.text,
                      model2.text,
                      model3.text,
                      model4.text,
                      model5.text,
                    ],
                    directions: directions2.text,
                    videoLink: yt1.text,
                  );
                } else if (state is Uploaded3) {
                  if (Navigator.canPop(context)) Navigator.pop(context);
                  pdfThird = state.path;
                  act3 = Activity3Entity(
                    pdf: pdfThird,
                    multipleChoices: [
                      MultipleChoiceEntity(
                        answer: jointA1.text,
                        question: jointQ1.text,
                        choices: jointC1.map((e) {
                          int key = jointC1.indexOf(e) + 1;
                          return '$key,${e.text}';
                        }).toList(),
                      ),
                      MultipleChoiceEntity(
                        answer: jointA2.text,
                        question: jointQ2.text,
                        choices: jointC2.map((e) {
                          int key = jointC2.indexOf(e) + 1;
                          return '$key,${e.text}';
                        }).toList(),
                      ),
                      MultipleChoiceEntity(
                        answer: jointA3.text,
                        question: jointQ3.text,
                        choices: jointC3.map((e) {
                          int key = jointC3.indexOf(e) + 1;

                          return '$key,${e.text}';
                        }).toList(),
                      ),
                      MultipleChoiceEntity(
                        answer: jointA4.text,
                        question: jointQ4.text,
                        choices: jointC4.map((e) {
                          int key = jointC4.indexOf(e) + 1;
                          return '$key,${e.text}';
                        }).toList(),
                      ),
                      MultipleChoiceEntity(
                        answer: jointA5.text,
                        question: jointQ5.text,
                        choices: jointC5.map((e) {
                          int key = jointC5.indexOf(e) + 1;

                          return '$key,${e.text}';
                        }).toList(),
                      ),
                    ],
                    directions: directions3.text,
                    videoLink: yt2.text,
                  );
                } else if (state is Uploaded4) {
                  pdfFourth = state.path;
                }
              },
              child: Stepper(
                controlsBuilder: (context, details) {
                  return Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomElevatedButton(
                          currentStep == 3 ? 'Upload' : 'Proceed',
                          onPressed: details.onStepContinue,
                          width: 38.w,
                        ),
                        CustomElevatedButton(
                          'Back',
                          onPressed: details.onStepCancel,
                          width: 38.w,
                        ),
                      ],
                    ),
                  );
                },
                type: StepperType.horizontal,
                currentStep: currentStep,
                onStepTapped: (v) {
                  context.read<StepperCubit>().proceed(v - 1);
                },
                onStepContinue: () {
                  if (currentStep == 0) {
                    final microId =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    context.read<StepperCubit>().proceed(currentStep);
                    context.read<StorageCubit>().onUploadFile1(
                          path: 'act1/pdf/$microId',
                          file: File(pdf1!.files.first.path!),
                        );
                  } else if (currentStep == 1) {
                    final microId =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    context.read<StepperCubit>().proceed(currentStep);
                    context.read<StorageCubit>().onUploadFile2(
                          path: 'act2/pdf/$microId',
                          file: File(pdf2!.files.first.path!),
                        );
                  } else if (currentStep == 2) {
                    final microId =
                        DateTime.now().microsecondsSinceEpoch.toString();
                    context.read<StepperCubit>().proceed(currentStep);
                    context.read<StorageCubit>().onUploadFile3(
                          path: 'act3/pdf/$microId',
                          file: File(pdf3!.files.first.path!),
                        );
                    context.read<StorageCubit>().onUploadFile4(
                          path: 'act4/pdf/$microId',
                          file: File(pdf4!.files.first.path!),
                        );
                  } else if (currentStep == 3) {
                    final id = DateTime.now().microsecondsSinceEpoch.toString();
                    final lesson = LessonEntity(
                      id: id,
                      name: name.text,
                      createdAt: DateTime.now().toString(),
                      activity1: act1,
                      activity2: act2,
                      activity3: act3,
                      learningActPdf: pdfFourth,
                      students: [],
                    );
                    context
                        .read<LessonCubit>()
                        .onAddLesson(lesson: lesson)
                        .then((value) {
                      if (AutoRouter.of(context).canPop()) {
                        AutoRouter.of(context).pop();
                      }
                      if (AutoRouter.of(context).canPop()) {
                        AutoRouter.of(context).pop();
                      }
                      if (AutoRouter.of(context).canPop()) {
                        AutoRouter.of(context).pop();
                      }
                      if (AutoRouter.of(context).canPop()) {
                        AutoRouter.of(context).pop();
                      }
                      if (AutoRouter.of(context).canPop()) {
                        AutoRouter.of(context).pop();
                      }
                      if (AutoRouter.of(context).canPop()) {
                        AutoRouter.of(context).pop();
                      }
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: CustomText('uploaded successfully'),
                        duration: Duration(milliseconds: 400),
                      ));
                    });
                  }
                },
                onStepCancel: () {
                  if (currentStep == 0) {
                    AutoRouter.of(context).pop();
                  }
                  context.read<StepperCubit>().back(currentStep);
                },
                steps: [
                  Step(
                    state: StepState.editing,
                    isActive: currentStep == 0,
                    title: const CustomText('1'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextfield(
                          'Lesson Name',
                          controller: name,
                        ),
                        const Divider(),
                        const CustomText('Introduction'),
                        CustomElevatedButton(
                          'Pick File',
                          bgColor: Theme.of(context).primaryColor,
                          color: Colors.white,
                          onPressed: () {
                            context.read<FilePickerFirstCubit>().pickFile();
                          },
                        ),
                        if (pdf1 != null) SizedBox(height: 1.h),
                        if (pdf1 != null)
                          CustomText(
                            pdf1.files.first.name,
                            color: Theme.of(context).primaryColor,
                            weight: FontWeight.w600,
                          ),
                        const Divider(),
                        CustomText(
                          'ENRICHING VOCABULARY',
                          size: 18.sp,
                        ),
                        SizedBox(height: 2.h),
                        CustomTextfield(
                          'enter a directions',
                          controller: directions1,
                          label: const CustomText('Directions'),
                        ),
                        SizedBox(height: 1.h),
                        CustomText(
                          'No. 1',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ1,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP1,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD1,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS1,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA1,
                        ),
                        const Divider(),
                        CustomText(
                          'No.2',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ2,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP2,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD2,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS2,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA2,
                        ),
                        const Divider(),
                        CustomText(
                          'No.3',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ3,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP3,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD3,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS3,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA3,
                        ),
                        const Divider(),
                        CustomText(
                          'No.4',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ4,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP4,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD4,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS4,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA4,
                        ),
                        const Divider(),
                        CustomText(
                          'No.5',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ5,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP5,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD5,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS5,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA5,
                        ),
                        const Divider(),
                        CustomText(
                          'No.6',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ6,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP6,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD6,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS6,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA6,
                        ),
                        const Divider(),
                        CustomText(
                          'No.7',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ7,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP7,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD7,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS7,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA7,
                        ),
                        const Divider(),
                        CustomText(
                          'No.8',
                          size: 16.sp,
                        ),
                        CustomTextfield(
                          'enter a jumbled word',
                          controller: vocabJ8,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a pronounciation',
                          controller: vocabP8,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a definition',
                          controller: vocabD8,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a sentence',
                          controller: vocabS8,
                        ),
                        SizedBox(height: 1.h),
                        CustomTextfield(
                          'enter a answer',
                          controller: vocabA8,
                        ),
                      ],
                    ),
                  ),
                  Step(
                      state: StepState.editing,
                      isActive: currentStep == 1,
                      title: const CustomText('2'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomElevatedButton(
                            'Pick File',
                            bgColor: Theme.of(context).primaryColor,
                            color: Colors.white,
                            onPressed: () {
                              context.read<FilePickersecondCubit>().pickFile();
                            },
                          ),
                          if (pdf2 != null) SizedBox(height: 1.h),
                          if (pdf2 != null)
                            CustomText(
                              pdf2.files.first.name,
                              color: Theme.of(context).primaryColor,
                              weight: FontWeight.w600,
                            ),
                          SizedBox(height: 1.h),
                          const CustomText('Youtube link'),
                          CustomTextfield(
                            'enter youtube link',
                            controller: yt1,
                          ),
                          const Divider(),
                          CustomText(
                            'COMPREHENSION CHECK',
                            size: 18.sp,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(height: 2.h),
                          CustomTextfield(
                            'enter a directions',
                            controller: directions2,
                            label: const CustomText('Directions'),
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'No. 1',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: model1,
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'No. 2',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: model2,
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'No. 3',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: model3,
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'No. 4',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: model4,
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'No. 5',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: model5,
                          ),
                        ],
                      )),
                  Step(
                      state: StepState.editing,
                      isActive: currentStep == 2,
                      title: const CustomText('3'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomElevatedButton(
                            'Pick File',
                            bgColor: Theme.of(context).primaryColor,
                            color: Colors.white,
                            onPressed: () {
                              context.read<FilePickerthirdCubit>().pickFile();
                            },
                          ),
                          if (pdf3 != null) SizedBox(height: 1.h),
                          if (pdf3 != null)
                            CustomText(
                              pdf3.files.first.name,
                              color: Theme.of(context).primaryColor,
                              weight: FontWeight.w600,
                            ),
                          SizedBox(height: 1.h),
                          const CustomText('Youtube link'),
                          CustomTextfield(
                            'enter youtube link',
                            controller: yt2,
                          ),
                          const Divider(),
                          CustomText(
                            'LEARNING TASK',
                            size: 18.sp,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(height: 2.h),
                          CustomTextfield(
                            'enter a directions',
                            controller: directions3,
                            label: const CustomText('Directions'),
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'No. 1',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: jointQ1,
                            label: const CustomText('Question'),
                          ),
                          SizedBox(height: 1.h),
                          const CustomText('Choices'),
                          Column(
                            children: jointC1
                                .map((e) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0.5.h),
                                      child: CustomTextfield(
                                        '${jointC1.indexOf(e) + 1}',
                                        controller: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const CustomText('Answer'),
                          CustomTextfield(
                            'answer',
                            controller: jointA1,
                          ),
                          const Divider(),
                          CustomText(
                            'No. 2',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: jointQ2,
                            label: const CustomText('Question'),
                          ),
                          SizedBox(height: 1.h),
                          const CustomText('Choices'),
                          Column(
                            children: jointC2
                                .map((e) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0.5.h),
                                      child: CustomTextfield(
                                        '${jointC2.indexOf(e) + 1}',
                                        controller: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const CustomText('Answer'),
                          CustomTextfield(
                            'answer',
                            controller: jointA2,
                          ),
                          const Divider(),
                          CustomText(
                            'No. 3',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: jointQ3,
                            label: const CustomText('Question'),
                          ),
                          SizedBox(height: 1.h),
                          const CustomText('Choices'),
                          Column(
                            children: jointC3
                                .map((e) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0.5.h),
                                      child: CustomTextfield(
                                        '${jointC3.indexOf(e) + 1}',
                                        controller: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const CustomText('Answer'),
                          CustomTextfield(
                            'answer',
                            controller: jointA3,
                          ),
                          const Divider(),
                          CustomText(
                            'No. 4',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: jointQ4,
                            label: const CustomText('Question'),
                          ),
                          SizedBox(height: 1.h),
                          const CustomText('Choices'),
                          Column(
                            children: jointC4
                                .map((e) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0.5.h),
                                      child: CustomTextfield(
                                        '${jointC4.indexOf(e) + 1}',
                                        controller: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const CustomText('Answer'),
                          CustomTextfield(
                            'answer',
                            controller: jointA4,
                          ),
                          const Divider(),
                          CustomText(
                            'No. 5',
                            size: 16.sp,
                          ),
                          CustomTextfield(
                            'enter a question',
                            controller: jointQ5,
                            label: const CustomText('Question'),
                          ),
                          SizedBox(height: 1.h),
                          const CustomText('Choices'),
                          Column(
                            children: jointC5
                                .map((e) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0.5.h),
                                      child: CustomTextfield(
                                        '${jointC5.indexOf(e) + 1}',
                                        controller: e,
                                      ),
                                    ))
                                .toList(),
                          ),
                          const CustomText('Answer'),
                          CustomTextfield(
                            'answer',
                            controller: jointA5,
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'LEARNING ACTIVITY',
                            size: 18.sp,
                            weight: FontWeight.w500,
                          ),
                          CustomElevatedButton(
                            'Pick File',
                            bgColor: Theme.of(context).primaryColor,
                            color: Colors.white,
                            onPressed: () {
                              context.read<FilePickerFourthCubit>().pickFile();
                            },
                          ),
                          if (pdf4 != null) SizedBox(height: 1.h),
                          if (pdf4 != null)
                            CustomText(
                              pdf4.files.first.name,
                              color: Theme.of(context).primaryColor,
                              weight: FontWeight.w600,
                            ),
                          SizedBox(height: 1.h),
                        ],
                      )),
                  Step(
                    isActive: currentStep == 3,
                    state: StepState.complete,
                    title: const CustomText('Upload'),
                    content: Center(
                      child: Column(
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              AutoRouter.of(context).pop();
                            },
                            icon: const Icon(Icons.home_outlined),
                            label: const CustomText('to home'),
                          ),
                          BlocListener<LessonCubit, LessonState>(
                              listener: (context, state) {
                                if (state is LessonLoading) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (_) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                }
                              },
                              child: const SizedBox.shrink()),
                        ],
                      ),
                    ),
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
