import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<XFile?> {
  ImageCubit() : super(null);

  Future<void> pickImage(ImageSource source) async {
    await ImagePicker().pickImage(source: source).then((value) => emit(value));
  }

  void dispose() => emit(null);
}
