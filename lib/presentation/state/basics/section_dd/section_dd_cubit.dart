import 'package:flutter_bloc/flutter_bloc.dart';

class SectionDdCubit extends Cubit<String?> {
  SectionDdCubit() : super(null);

  void pickSection(String section) => emit(section);
}
