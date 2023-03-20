import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilePickersecondCubit extends Cubit<FilePickerResult?> {
  FilePickersecondCubit() : super(null);
  void pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      emit(null);
    } else {
      emit(result);
    }
  }
}
