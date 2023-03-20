import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesis1/domain/entity/record_entity.dart';

class Act5Cubit extends Cubit<ActivityEntity?> {
  Act5Cubit() : super(null);

  void addAct(ActivityEntity act) {
    emit(act);
  }
}
