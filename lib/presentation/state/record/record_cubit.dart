// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thesis1/domain/entity/record_entity.dart';
import 'package:thesis1/domain/usecase/firestore/update_acts.dart';

import '../../../domain/usecase/firestore/add_student_record.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit(
    this.addStudentRecord,
    this.updateActs,
  ) : super(RecordInitial());
  final AddStudentRecord addStudentRecord;
  final UpdateActs updateActs;

  Future<void> onAddStudentRecord({
    required String userId,
    required String lessonId,
    required RecordEntity record,
  }) async {
    emit(RecordLoading());
    await addStudentRecord(userId: userId, lessonId: lessonId, record: record)
        .then((value) => emit(Done()));
  }

  Future<void> onUpdateActs({
    required String userId,
    required String id,
    required List<ActivityEntity> act,
    required String key,
  }) async {
    emit(RecordLoading());
    await updateActs(
      userId: userId,
      id: id,
      act: act,
      key: key,
    ).then((value) => emit(Done()));
  }
}
