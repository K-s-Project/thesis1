// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/core/model/emoji.dart';
import 'package:thesis1/core/router/custom_router.dart';
import 'package:thesis1/domain/entity/record_entity.dart';
import 'package:thesis1/presentation/state/acts/act1_cubit.dart';
import 'package:thesis1/presentation/state/acts/act1bool_cubit.dart';
import 'package:thesis1/presentation/state/acts/act5_cubit.dart';
import 'package:thesis1/presentation/state/basics/feedback/feedback_cubit.dart';
import 'package:thesis1/presentation/state/persistence/persistence_cubit.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:thesis1/domain/entity/lesson_entity.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

import '../../state/acts/act2_cubit.dart';
import '../../state/acts/act2bool_cubit.dart';
import '../../state/acts/act3_cubit.dart';
import '../../state/acts/act3bool_cubit.dart';
import '../../state/acts/act4_cubit.dart';
import '../../state/acts/act4bool_cubit.dart';
import '../../state/acts/act5bool_cubit.dart';
import '../../state/acts/acts1_cubit.dart';
import '../../state/acts/acts2_cubit.dart';
import '../../state/answers/answers.dart';
import '../../state/record/record_cubit.dart';

class LessonDetailScreen extends StatefulWidget {
  final LessonEntity lesson;
  const LessonDetailScreen({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  List<TextEditingController> vocabs = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<TextEditingController> answers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController reflections1 = TextEditingController();
  TextEditingController reflections2 = TextEditingController();
  TextEditingController reflections3 = TextEditingController();

  String? videoId1;
  String? videoId2;

  late YoutubePlayerController controller1;
  late YoutubePlayerController controller2;
  List<ActivityEntity>? activity1;
  List<ActivityEntity>? activity2;
  List<ActivityEntity>? activity3;

  @override
  void initState() {
    super.initState();
    context.read<PersistenceCubit>().onRecordLoc(
          userId: FirebaseAuth.instance.currentUser?.uid ?? '',
          id: widget.lesson.id,
        );
    controller1 = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.lesson.activity2.videoLink!)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    controller2 = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.lesson.activity3.videoLink!)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    context.read<Answer1Cubit>().chooseAnswer(
          myAnswer: '',
          rightAnswer: '',
          question: '',
        );
    context.read<Answer2Cubit>().chooseAnswer(
          myAnswer: '',
          rightAnswer: '',
          question: '',
        );
    context.read<Answer3Cubit>().chooseAnswer(
          myAnswer: '',
          rightAnswer: '',
          question: '',
        );
    context.read<Answer4Cubit>().chooseAnswer(
          myAnswer: '',
          rightAnswer: '',
          question: '',
        );
    context.read<Answer5Cubit>().chooseAnswer(
          myAnswer: '',
          rightAnswer: '',
          question: '',
        );
  }

  String? ans1;
  String? ans2;
  String? ans3;
  String? ans4;
  String? ans5;
  ActivityEntity? joint1;
  ActivityEntity? joint2;
  ActivityEntity? joint3;
  ActivityEntity? joint4;
  ActivityEntity? joint5;

  List<ActivityEntity>? acts3 = [];

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final answer1 = context.select((Answer1Cubit answer) => answer.state);
        final answer2 = context.select((Answer2Cubit answer) => answer.state);
        final answer3 = context.select((Answer3Cubit answer) => answer.state);
        final answer4 = context.select((Answer4Cubit answer) => answer.state);
        final answer5 = context.select((Answer5Cubit answer) => answer.state);
        final act1bool = context.select((Act1boolCubit answer) => answer.state);
        final act2bool = context.select((Act2boolCubit answer) => answer.state);
        final act3bool = context.select((Act3boolCubit answer) => answer.state);
        final act4bool = context.select((Act4boolCubit answer) => answer.state);
        final act5bool = context.select((Act5boolCubit answer) => answer.state);
        var act1 = context.select((Act1Cubit act1) => act1.state);
        var act2 = context.select((Act2Cubit act2) => act2.state);
        var act3 = context.select((Act3Cubit act3) => act3.state);
        var act4 = context.select((Act4Cubit act4) => act4.state);
        var act5 = context.select((Act5Cubit act5) => act5.state);
        final acts1 = context.select((Acts1Cubit acts1) => acts1.state);
        final acts2 = context.select((Acts2Cubit acts2) => acts2.state);
        final emoji = context.select((FeedbackCubit fb) => fb.state);
        print('acts2: $acts2');
        context
            .read<Act5boolCubit>()
            .set(answer5.myAnswer == answer5.rightAnswer);
        context
            .read<Act4boolCubit>()
            .set(answer4.myAnswer == answer4.rightAnswer);
        context
            .read<Act3boolCubit>()
            .set(answer3.myAnswer == answer3.rightAnswer);
        context
            .read<Act2boolCubit>()
            .set(answer2.myAnswer == answer2.rightAnswer);
        context
            .read<Act1boolCubit>()
            .set(answer1.myAnswer == answer1.rightAnswer);
        act5 = ActivityEntity(
          answer: answer5.myAnswer,
          correct: act5bool,
          question: answer5.question,
        );
        act4 = ActivityEntity(
          answer: answer4.myAnswer,
          correct: act4bool,
          question: answer4.question,
        );
        act3 = ActivityEntity(
          answer: answer3.myAnswer,
          correct: act3bool,
          question: answer3.question,
        );
        act2 = ActivityEntity(
          answer: answer2.myAnswer,
          correct: act2bool,
          question: answer2.question,
        );
        act1 = ActivityEntity(
          answer: answer1.myAnswer,
          correct: act1bool,
          question: answer1.question,
        );
        List<String?> ans = [
          answer1.myAnswer,
          answer2.myAnswer,
          answer3.myAnswer,
          answer4.myAnswer,
          answer5.myAnswer,
        ];
        return BlocConsumer<PersistenceCubit, PersistenceState>(
          listener: (context, state) {
            if (state is Loading) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: CustomText('Loading...'),
                duration: Duration(milliseconds: 400),
              ));
            } else if (state is Loaded) {
              activity1 = state.record.activity1;
              activity2 = state.record.activity2;
              activity3 = state.record.activity3;
              print('activity1 $activity1');
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: CustomText('Loaded'),
                duration: Duration(milliseconds: 400),
              ));
              for (int index = 0;
                  index <
                      num.parse(
                          state.record.activity1?.length.toString() ?? '0');
                  index++) {
                vocabs[index].text =
                    state.record.activity1?[index].answer ?? '';
              }
              for (int index = 0;
                  index <
                      num.parse(
                          state.record.activity2?.length.toString() ?? '0');
                  index++) {
                answers[index].text =
                    state.record.activity2?[index].answer ?? "";
              }
              if (state.record.activity3?.isNotEmpty ?? false) {
                context.read<Answer1Cubit>().chooseAnswer(
                      myAnswer: state.record.activity3?.first.answer ?? '',
                      rightAnswer: '',
                      question: state.record.activity3?.first.question ?? '',
                    );
                context.read<Answer2Cubit>().chooseAnswer(
                      myAnswer: state.record.activity3?[1].answer ?? '',
                      rightAnswer: '',
                      question: state.record.activity3?[1].question ?? '',
                    );
                context.read<Answer3Cubit>().chooseAnswer(
                      myAnswer: state.record.activity3?[2].answer ?? '',
                      rightAnswer: '',
                      question: state.record.activity3?[2].question ?? '',
                    );
                context.read<Answer4Cubit>().chooseAnswer(
                      myAnswer: state.record.activity3?[3].answer ?? '',
                      rightAnswer: '',
                      question: state.record.activity3?[3].question ?? '',
                    );
                context.read<Answer5Cubit>().chooseAnswer(
                      myAnswer: state.record.activity3?[4].answer ?? '',
                      rightAnswer: '',
                      question: state.record.activity3?[4].question ?? '',
                    );
              } else if (state is Saved) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: CustomText('Saved'),
                  duration: Duration(milliseconds: 400),
                ));
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: CustomText(widget.lesson.name),
                ),
                body: RefreshIndicator(
                  onRefresh: () async {
                    context.read<PersistenceCubit>().onRecordLoc(
                          userId: FirebaseAuth.instance.currentUser?.uid ?? '',
                          id: widget.lesson.id,
                        );
                  },
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            'Introduction',
                            size: 18.sp,
                            weight: FontWeight.w600,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              AutoRouter.of(context).push(ViewPdfRoute(
                                  pdfLink: widget.lesson.activity1.pdf));
                            },
                            icon: const Icon(Icons.view_agenda),
                            label: const CustomText('view pdf'),
                          ),
                          SizedBox(height: 1.h),
                          CustomText(
                            'ENRICHING VOCABULARY',
                            size: 18.sp,
                            weight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                          CustomText(
                            'Directions: ${widget.lesson.activity1.directions}',
                            color: Colors.black,
                          ),
                          Column(
                            children: widget.lesson.activity1.fitbs.map((e) {
                              if (vocabs.first.text.isNotEmpty &&
                                  vocabs[1].text.isNotEmpty &&
                                  vocabs[2].text.isNotEmpty &&
                                  vocabs[3].text.isNotEmpty &&
                                  vocabs[4].text.isNotEmpty &&
                                  vocabs[5].text.isNotEmpty &&
                                  vocabs[6].text.isNotEmpty &&
                                  vocabs[7].text.isNotEmpty &&
                                  acts1.length <= 7) {
                                context.read<Acts1Cubit>().add1(ActivityEntity(
                                      answer: vocabs[widget
                                              .lesson.activity1.fitbs
                                              .indexOf(e)]
                                          .text,
                                      correct: vocabs[widget
                                                  .lesson.activity1.fitbs
                                                  .indexOf(e)]
                                              .text ==
                                          e.answer,
                                      question: e.sentence,
                                    ));
                              }

                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(0.5.h),
                                    padding: EdgeInsets.all(1.h),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          'No. ${widget.lesson.activity1.fitbs.indexOf(e) + 1}',
                                          size: 16.sp,
                                          weight: FontWeight.w600,
                                        ),
                                        RichText(
                                            text: TextSpan(
                                          text: 'JUMBLED WORD: ',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 14.sp,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: e.jumbledWord,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        )),
                                        SizedBox(height: 0.5.h),
                                        RichText(
                                            text: TextSpan(
                                          text: 'PRONOUNCIATION: ',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 14.sp,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: e.pronounciation,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        )),
                                        SizedBox(height: 0.5.h),
                                        RichText(
                                            text: TextSpan(
                                          text: 'DEFINITION: ',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 14.sp,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: e.definition,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        )),
                                        SizedBox(height: 0.5.h),
                                        RichText(
                                            text: TextSpan(
                                          text: 'SENTENCE: ',
                                          style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 14.sp,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: e.sentence,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ],
                                        )),
                                        SizedBox(height: 1.h),
                                        CustomTextfield(
                                          'type your answer',
                                          maxLines: 1,
                                          minLines: 1,
                                          radius: 4,
                                          controller: vocabs[widget
                                              .lesson.activity1.fitbs
                                              .indexOf(e)],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                          (activity1 ?? []).isEmpty
                              ? CustomElevatedButton(
                                  'Save',
                                  onPressed: acts1 != null
                                      ? () async {
                                          setState(() {});
                                          final record = RecordEntity(
                                            id: widget.lesson.id,
                                            name: widget.lesson.name,
                                            createdAt:
                                                DateTime.now().toString(),
                                            activity1: acts1,
                                            activity2: acts2,
                                            activity3: acts3 ?? [],
                                            reflections: [
                                              reflections1,
                                              reflections2,
                                              reflections3,
                                            ].map((e) => e.text).toList(),
                                            feedback:
                                                emoji?.label ?? 'no feedback',
                                          );
                                          if ((activity1 ?? []).isEmpty) {
                                            context
                                                .read<PersistenceCubit>()
                                                .onAddInitialRecord(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      "",
                                                  id: widget.lesson.id,
                                                  record: record,
                                                )
                                                .then((value) {
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: CustomText('Saved'),
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                ));
                                              }
                                            });
                                          } else {
                                            context
                                                .read<RecordCubit>()
                                                .onUpdateActs(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      "",
                                                  id: widget.lesson.id,
                                                  act: acts1,
                                                  key: 'activity1',
                                                )
                                                .then((value) {
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: CustomText('Saved'),
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                ));
                                              }
                                            });
                                          }
                                        }
                                      : null,
                                  bgColor:
                                      Theme.of(context).secondaryHeaderColor,
                                )
                              : const SizedBox.shrink(),
                          SizedBox(height: 4.h),
                          CustomText(
                            'LESSON PROPER',
                            size: 18.sp,
                            weight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                          CustomText(
                            'Directions: ${widget.lesson.activity2.directions}',
                            color: Colors.black,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              AutoRouter.of(context).push(ViewPdfRoute(
                                  pdfLink: widget.lesson.activity2.pdf));
                            },
                            icon: const Icon(Icons.view_agenda),
                            label: const CustomText('view pdf'),
                          ),
                          YoutubePlayer(
                            controller: controller1,
                            showVideoProgressIndicator: true,
                          ),
                          SizedBox(height: 2.h),
                          Card(
                            color: Colors.white,
                            child: Column(
                              children:
                                  widget.lesson.activity2.questions.map((q) {
                                print(answers[widget.lesson.activity2.questions
                                        .indexOf(q)]
                                    .text);
                                if (answers.first.text.isNotEmpty &&
                                    answers[1].text.isNotEmpty &&
                                    answers[2].text.isNotEmpty &&
                                    answers[3].text.isNotEmpty &&
                                    answers[4].text.isNotEmpty &&
                                    acts2.length <= 4) {
                                  context
                                      .read<Acts2Cubit>()
                                      .add1(ActivityEntity(
                                        answer: answers[widget
                                                .lesson.activity2.questions
                                                .indexOf(q)]
                                            .text,
                                        correct: false,
                                        question: q,
                                      ));
                                }

                                return ListTile(
                                  title: CustomText(
                                      'Q${widget.lesson.activity2.questions.indexOf(q) + 1}: $q'),
                                  subtitle: CustomTextfield(
                                    'type your answer',
                                    controller: answers[widget
                                        .lesson.activity2.questions
                                        .indexOf(q)],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          (activity2 ?? []).isEmpty
                              ? CustomElevatedButton(
                                  'Save',
                                  onPressed: acts2 != null
                                      ? () async {
                                          if (act1 != null &&
                                              act2 != null &&
                                              act3 != null &&
                                              act4 != null &&
                                              act5 != null &&
                                              acts3!.length < 5) {
                                            acts3?.addAll([
                                              act1,
                                              act2,
                                              act3,
                                              act4,
                                              act5,
                                            ]);
                                          }
                                          setState(() {});
                                          final record = RecordEntity(
                                            id: widget.lesson.id,
                                            name: widget.lesson.name,
                                            createdAt:
                                                DateTime.now().toString(),
                                            activity1: acts1,
                                            activity2: acts2,
                                            activity3: acts3 ?? [],
                                            reflections: [
                                              reflections1,
                                              reflections2,
                                              reflections3,
                                            ].map((e) => e.text).toList(),
                                            feedback:
                                                emoji?.label ?? 'no feedback',
                                          );
                                          if ((activity1 ?? []).isEmpty) {
                                            context
                                                .read<PersistenceCubit>()
                                                .onAddInitialRecord(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      "",
                                                  id: widget.lesson.id,
                                                  record: record,
                                                )
                                                .then((value) {
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: CustomText('Saved'),
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                ));
                                              }
                                            });
                                          } else {
                                            context
                                                .read<RecordCubit>()
                                                .onUpdateActs(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      "",
                                                  id: widget.lesson.id,
                                                  act: acts2,
                                                  key: 'activity2',
                                                )
                                                .then((value) {
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: CustomText('Saved'),
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                ));
                                              }
                                            });
                                          }
                                        }
                                      : null,
                                  bgColor:
                                      Theme.of(context).secondaryHeaderColor,
                                )
                              : const SizedBox.shrink(),
                          SizedBox(height: 4.h),
                          CustomText(
                            'LEARNING TASK',
                            size: 18.sp,
                            weight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                          CustomText(
                            'Directions: ${widget.lesson.activity3.directions}',
                            color: Colors.black,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              AutoRouter.of(context).push(ViewPdfRoute(
                                  pdfLink: widget.lesson.activity3.pdf));
                            },
                            icon: const Icon(Icons.view_agenda),
                            label: const CustomText('view pdf'),
                          ),
                          YoutubePlayer(
                            controller: controller2,
                            showVideoProgressIndicator: true,
                          ),
                          SizedBox(height: 2.h),
                          Card(
                            color: Colors.white,
                            child: Column(
                              children: widget.lesson.activity3.multipleChoices
                                  .map((q) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: CustomText(
                                          'Q${widget.lesson.activity3.multipleChoices.indexOf(q) + 1}: ${q.question}'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const CustomText('Choices:'),
                                          Wrap(
                                            spacing: 2.w,
                                            children: q.choices.map((e) {
                                              return InkWell(
                                                onTap: () {
                                                  print('test');
                                                  if (widget.lesson.activity3
                                                          .multipleChoices
                                                          .indexOf(q) ==
                                                      0) {
                                                    print('hello');
                                                    context
                                                        .read<Answer1Cubit>()
                                                        .chooseAnswer(
                                                          myAnswer: e,
                                                          rightAnswer: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  0]
                                                              .answer,
                                                          question: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  0]
                                                              .question,
                                                        );
                                                  } else if (widget
                                                          .lesson
                                                          .activity3
                                                          .multipleChoices
                                                          .indexOf(q) ==
                                                      1) {
                                                    print('hello');

                                                    context
                                                        .read<Answer2Cubit>()
                                                        .chooseAnswer(
                                                          myAnswer: e,
                                                          rightAnswer: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  1]
                                                              .answer,
                                                          question: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  1]
                                                              .question,
                                                        );
                                                  } else if (widget
                                                          .lesson
                                                          .activity3
                                                          .multipleChoices
                                                          .indexOf(q) ==
                                                      2) {
                                                    context
                                                        .read<Answer3Cubit>()
                                                        .chooseAnswer(
                                                          myAnswer: e,
                                                          rightAnswer: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  2]
                                                              .answer,
                                                          question: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  2]
                                                              .question,
                                                        );
                                                  } else if (widget
                                                          .lesson
                                                          .activity3
                                                          .multipleChoices
                                                          .indexOf(q) ==
                                                      3) {
                                                    context
                                                        .read<Answer4Cubit>()
                                                        .chooseAnswer(
                                                          myAnswer: e,
                                                          rightAnswer: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  3]
                                                              .answer,
                                                          question: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  3]
                                                              .question,
                                                        );
                                                  } else if (widget
                                                          .lesson
                                                          .activity3
                                                          .multipleChoices
                                                          .indexOf(q) ==
                                                      4) {
                                                    context
                                                        .read<Answer5Cubit>()
                                                        .chooseAnswer(
                                                          myAnswer: e,
                                                          rightAnswer: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  4]
                                                              .answer,
                                                          question: widget
                                                              .lesson
                                                              .activity3
                                                              .multipleChoices[
                                                                  4]
                                                              .question,
                                                        );
                                                  }
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 1.h,
                                                    horizontal: 4.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: ans[widget
                                                                .lesson
                                                                .activity3
                                                                .multipleChoices
                                                                .indexOf(q)] ==
                                                            e
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: CustomText(
                                                      e.split(',').last),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          (activity3 ?? []).isEmpty
                              ? CustomElevatedButton(
                                  'Save',
                                  onPressed: acts3 != null
                                      ? () async {
                                          if (act1 != null &&
                                              act2 != null &&
                                              act3 != null &&
                                              act4 != null &&
                                              act5 != null &&
                                              acts3!.length < 5) {
                                            acts3?.addAll([
                                              act1,
                                              act2,
                                              act3,
                                              act4,
                                              act5,
                                            ]);
                                          }
                                          setState(() {});
                                          final record = RecordEntity(
                                            id: widget.lesson.id,
                                            name: widget.lesson.name,
                                            createdAt:
                                                DateTime.now().toString(),
                                            activity1: acts1,
                                            activity2: acts2,
                                            activity3: acts3 ?? [],
                                            reflections: [
                                              reflections1,
                                              reflections2,
                                              reflections3,
                                            ].map((e) => e.text).toList(),
                                            feedback:
                                                emoji?.label ?? 'no feedback',
                                          );

                                          if ((activity1 ?? []).isEmpty) {
                                            context
                                                .read<PersistenceCubit>()
                                                .onAddInitialRecord(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      "",
                                                  id: widget.lesson.id,
                                                  record: record,
                                                )
                                                .then((value) {
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: CustomText('Saved'),
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                ));
                                              }
                                            });
                                          } else {
                                            context
                                                .read<RecordCubit>()
                                                .onUpdateActs(
                                                  userId: FirebaseAuth.instance
                                                          .currentUser?.uid ??
                                                      "",
                                                  id: widget.lesson.id,
                                                  act: acts3 ?? [],
                                                  key: 'activity3',
                                                )
                                                .then((value) {
                                              if (Navigator.canPop(context)) {
                                                Navigator.pop(context);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: CustomText('Saved'),
                                                  duration: Duration(
                                                      milliseconds: 400),
                                                ));
                                              }
                                            });
                                          }
                                        }
                                      : null,
                                  bgColor:
                                      Theme.of(context).secondaryHeaderColor,
                                )
                              : const SizedBox.shrink(),
                          CustomText(
                            'LEARNING ACTIVITY',
                            size: 18.sp,
                            weight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                          TextButton.icon(
                            onPressed: () {
                              AutoRouter.of(context).push(ViewPdfRoute(
                                  pdfLink: widget.lesson.learningActPdf));
                            },
                            icon: const Icon(Icons.view_agenda),
                            label: const CustomText('view pdf'),
                          ),
                          SizedBox(height: 2.h),
                          CustomText(
                            'REFLECTION',
                            size: 18.sp,
                            weight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                          const CustomText(
                            'Write your personal insights about the lesson using the prompts below.',
                            color: Colors.black,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: CustomTextfield(
                                  'I learned that...',
                                  controller: reflections1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: CustomTextfield(
                                  'I realized...',
                                  controller: reflections2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: CustomTextfield(
                                  'From now on,I will...',
                                  controller: reflections3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          CustomText(
                            'FEEDBACK',
                            size: 18.sp,
                            weight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                            textAlign: TextAlign.center,
                          ),
                          CustomText(
                            'Did you understand the lesson?',
                            size: 16.sp,
                          ),
                          CustomText(
                            'Click the emoji to show your satisfaction with the lesson.',
                            size: 16.sp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: feedbacks.map((e) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                  horizontal: 2.h,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<FeedbackCubit>()
                                        .pickFeecback(e);
                                  },
                                  child: Iconify(
                                    e.emoji,
                                    size: 40,
                                    color: e == emoji
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const Divider(
                            thickness: 3,
                          ),
                          SizedBox(height: 1.h),
                          CustomElevatedButton(
                            'Submit',
                            onPressed: () {
                              print('FINAL ANSWER LENGTH1: ${acts3?.length}');
                              if (act1 != null &&
                                  act2 != null &&
                                  act3 != null &&
                                  act4 != null &&
                                  act5 != null &&
                                  acts3!.length < 5) {
                                acts3?.addAll([
                                  act1,
                                  act2,
                                  act3,
                                  act4,
                                  act5,
                                ]);
                              }
                              final record = RecordEntity(
                                id: widget.lesson.id,
                                name: widget.lesson.name,
                                activity1: acts1,
                                activity2: acts2,
                                activity3: acts3 ?? [],
                                reflections: [
                                  reflections1,
                                  reflections2,
                                  reflections3,
                                ].map((e) => e.text).toList(),
                                feedback: emoji?.label ?? 'no feedback',
                              );

                              if (acts1.isNotEmpty &&
                                  acts2.isNotEmpty &&
                                  (acts3 ?? []).isNotEmpty &&
                                  [
                                    reflections1,
                                    reflections2,
                                    reflections3,
                                  ]
                                      .where(
                                          (element) => element.text.isNotEmpty)
                                      .toList()
                                      .isNotEmpty &&
                                  emoji != null) {
                                context
                                    .read<RecordCubit>()
                                    .onAddStudentRecord(
                                      userId: FirebaseAuth
                                              .instance.currentUser?.uid ??
                                          '',
                                      lessonId: widget.lesson.id,
                                      record: record,
                                    )
                                    .then((value) {
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          CustomText('Submit successfully'),
                                      duration: Duration(milliseconds: 400),
                                    ));
                                  }
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: CustomText(
                                      'please answer all the activity'),
                                  duration: Duration(milliseconds: 400),
                                ));
                              }
                            },
                            bgColor: Theme.of(context).primaryColor,
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          },
        );
      },
    );
  }
}
