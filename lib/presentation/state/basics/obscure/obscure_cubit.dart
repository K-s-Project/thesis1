import 'package:flutter_bloc/flutter_bloc.dart';

class ObscureCubit extends Cubit<bool> {
  ObscureCubit() : super(true);

  void hide() => emit(true);
  void show() => emit(false);
}
