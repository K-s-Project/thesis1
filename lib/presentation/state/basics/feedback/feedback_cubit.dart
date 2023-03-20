import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/emoji.dart';

class FeedbackCubit extends Cubit<Emoji?> {
  FeedbackCubit() : super(null);

  void pickFeecback(Emoji emoji) => emit(emoji);
}
