import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/record_entity.dart';

class Acts2Cubit extends Cubit<List<ActivityEntity>> {
  Acts2Cubit() : super([]);

  void add0(List<ActivityEntity> acts) => emit(acts);
  void add1(ActivityEntity act) {
    state.add(act);
    emit(state);
  }
}
