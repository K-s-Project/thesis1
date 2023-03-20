// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:thesis1/domain/entity/record_entity.dart';
import 'package:thesis1/domain/usecase/hive/get_record_loc.dart';

import '../../../domain/usecase/hive/add_initial_record.dart';

part 'persistence_state.dart';

class PersistenceCubit extends Cubit<PersistenceState> {
  PersistenceCubit(
    this.addInitialRecord,
    this.getRecordLoc,
  ) : super(PersistenceInitial());

  final AddInitialRecord addInitialRecord;
  final GetRecordLoc getRecordLoc;

  Future<void> onAddInitialRecord({
    required String userId,
    required String id,
    required RecordEntity record,
  }) async {
    emit(Loading());
    print('before recrd');
    await addInitialRecord(
      userId: userId,
      id: id,
      record: record,
    ).then((value) {
      print('in recrd');
      emit(Saved());
    });
    print('after recrd');
  }

  void onRecordLoc({
    required String userId,
    required String id,
  }) async {
    emit(Loading());
    await getRecordLoc(
      userId: userId,
      id: id,
    ).then((value) {
      emit(Loaded(record: value));
    });
  }
}
