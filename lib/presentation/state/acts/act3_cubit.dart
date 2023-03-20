import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesis1/domain/entity/record_entity.dart';

class Act3Cubit extends Cubit<ActivityEntity?> {
  Act3Cubit() : super(null);
  void addAct(ActivityEntity act) {
    emit(act);
  }
}
